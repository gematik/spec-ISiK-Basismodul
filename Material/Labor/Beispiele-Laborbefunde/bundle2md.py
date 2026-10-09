#!/usr/bin/env python3
"""
Markdown-Ansicht fuer ISiK-Bundles (ISiKBerichtBundle, FHIR R4).

Erzeugt zu jedem Bundle ``<Stem>.bundle.json`` eine Datei ``<Stem>.md`` mit den
Inhalten aller enthaltenen Ressourcen (Befund, Patient, Beteiligte, Diagnosen,
Proben, Laborergebnisse, Anhaenge, Composition-Abschnitte), damit die Beispiele
direkt in GitHub gelesen werden koennen. Zusaetzlich wird in ``README.md`` des
Bundle-Verzeichnisses die Uebersichtstabelle zwischen den Markern
``<!-- bundle-index:start -->`` und ``<!-- bundle-index:end -->`` aktualisiert.

Aufruf:  python3 bundle2md.py [--dir VERZEICHNIS] [DATEI.bundle.json ...]
Ohne Angaben werden alle *.bundle.json im Verzeichnis des Skripts verarbeitet.
Keine Abhaengigkeiten ausser Python 3.
"""
import base64
import glob
import json
import os
import re
import sys
from collections import Counter, OrderedDict
from html.parser import HTMLParser

INDEX_START = "<!-- bundle-index:start -->"
INDEX_END = "<!-- bundle-index:end -->"

SYSTEM_SHORT = OrderedDict([
    ("http://loinc.org", "LOINC"),
    ("http://snomed.info/sct", "SNOMED"),
    ("http://unitsofmeasure.org", "UCUM"),
    ("http://fhir.de/CodeSystem/bfarm/icd-10-gm", "ICD-10-GM"),
    ("http://fhir.de/CodeSystem/bfarm/atc", "ATC"),
    ("http://fhir.de/CodeSystem/ifa/pzn", "PZN"),
    ("http://dvmd.de/fhir/CodeSystem/kdl", "KDL"),
    ("http://ihe-d.de/CodeSystems/IHEXDStypeCode", "IHE-XDS-Typ"),
    ("http://ihe-d.de/CodeSystems/IHEXDSclassCode", "IHE-XDS-Klasse"),
    ("http://terminology.hl7.org/CodeSystem/v2-0203", "v2-0203"),
    ("http://terminology.hl7.org/CodeSystem/v2-0074", "v2-0074"),
    ("http://terminology.hl7.org/CodeSystem/v3-ActCode", "v3-ActCode"),
    ("http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation", "v3-Interp"),
    ("http://terminology.hl7.org/CodeSystem/observation-category", "obs-category"),
    ("http://terminology.hl7.org/CodeSystem/referencerange-meaning", "refrange"),
    ("http://terminology.hl7.org/CodeSystem/condition-clinical", "condition-clinical"),
    ("http://terminology.hl7.org/CodeSystem/condition-ver-status", "condition-ver-status"),
    ("http://terminology.hl7.org/CodeSystem/organization-type", "organization-type"),
    ("http://fhir.de/CodeSystem/identifier-type-de-basis", "de-basis"),
    ("https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT", "Diagnosesicherheit"),
    ("https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION", "Seitenlokalisation"),
])

EXT_DIAGNOSESICHERHEIT = "http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit"
EXT_SEITENLOKALISATION = "http://fhir.de/StructureDefinition/seitenlokalisation"

INTERPRETATION = {
    "N": "normal", "H": "erhoeht", "L": "erniedrigt", "HH": "kritisch erhoeht",
    "LL": "kritisch erniedrigt", "A": "auffaellig", "AA": "kritisch auffaellig",
    "S": "sensibel", "I": "intermediaer", "R": "resistent", "POS": "positiv",
    "NEG": "negativ", "IND": "unbestimmt", "DET": "nachgewiesen", "ND": "nicht nachgewiesen",
}


# ---------------------------------------------------------------------------
# Formatierungshilfen
# ---------------------------------------------------------------------------
def esc(s):
    """Text fuer eine Markdown-Tabellenzelle aufbereiten."""
    if s is None:
        return ""
    s = str(s).replace("\r\n", "\n").replace("\r", "\n")
    s = s.replace("|", "\\|").replace("\n", "<br>")
    return s.strip()


def sys_short(system):
    if not system:
        return ""
    if system in SYSTEM_SHORT:
        return SYSTEM_SHORT[system]
    if system.startswith("http://hl7.org/fhir/"):
        return system.rsplit("/", 1)[-1]
    if "labor-testdaten.example" in system:
        return "lokal"
    return system.rsplit("/", 1)[-1]


def coding_str(c):
    code = c.get("code", "")
    s = sys_short(c.get("system"))
    out = f"`{s}#{code}`" if s else f"`{code}`"
    if c.get("version"):
        out += f" (v{c['version']})"
    return out


def cc_text(c):
    """Sprechender Text eines CodeableConcept."""
    if not c:
        return ""
    if c.get("text"):
        return c["text"]
    for cod in c.get("coding", []):
        if cod.get("display"):
            return cod["display"]
    for cod in c.get("coding", []):
        if cod.get("code"):
            return cod["code"]
    return ""


def cc_codes(c):
    if not c:
        return ""
    return ", ".join(coding_str(cod) for cod in c.get("coding", []) if cod.get("code"))


def cc_full(c):
    """Text plus Codes."""
    if not c:
        return ""
    t, k = cc_text(c), cc_codes(c)
    if t and k and t not in k:
        return f"{t} ({k})"
    return t or k


def quantity(q):
    if not q:
        return ""
    v = q.get("value")
    if isinstance(v, float) and v.is_integer():
        v = int(v)
    out = f"{q.get('comparator', '')}{v if v is not None else ''}".strip()
    unit = q.get("unit") or q.get("code")
    if unit:
        out = f"{out} {unit}".strip()
    return out


def human_name(n):
    if not n:
        return ""
    parts = list(n.get("prefix", [])) + list(n.get("given", [])) + [n.get("family", "")] + list(n.get("suffix", []))
    s = " ".join(p for p in parts if p)
    return s or n.get("text", "")


def address(a):
    if not a:
        return ""
    parts = list(a.get("line", []))
    city = " ".join(p for p in [a.get("postalCode"), a.get("city")] if p)
    if city:
        parts.append(city)
    if a.get("country"):
        parts.append(a["country"])
    return ", ".join(parts)


def telecom(ts):
    return "<br>".join(f"{t.get('system', '')}: {t.get('value', '')}" + (f" ({t['use']})" if t.get("use") else "")
                       for t in ts or [])


def identifier_str(i):
    typ = ""
    if i.get("type"):
        typ = i["type"].get("coding", [{}])[0].get("code") or i["type"].get("text", "")
    v = i.get("value", "")
    return f"`{typ}` {v}" if typ else v


def identifiers(ids, with_system=False):
    out = []
    for i in ids or []:
        s = identifier_str(i)
        if with_system and i.get("system"):
            s += f"<br><sub>{i['system']}</sub>"
        out.append(s)
    return "<br>".join(out)


def period(p):
    if not p:
        return ""
    return f"{p.get('start', '')} – {p.get('end', '')}".strip(" –")


def notes(res):
    return [n.get("text", "") for n in res.get("note", []) if n.get("text")]


def value_str(r):
    """value[x] einer Observation/Komponente."""
    if "valueQuantity" in r:
        return quantity(r["valueQuantity"])
    if "valueCodeableConcept" in r:
        return cc_full(r["valueCodeableConcept"])
    if "valueString" in r:
        return r["valueString"]
    if "valueBoolean" in r:
        return "ja" if r["valueBoolean"] else "nein"
    if "valueInteger" in r:
        return str(r["valueInteger"])
    if "valueDateTime" in r:
        return r["valueDateTime"]
    if "valueDate" in r:
        return r["valueDate"]
    if "valueTime" in r:
        return r["valueTime"]
    if "valueRange" in r:
        rg = r["valueRange"]
        return f"{quantity(rg.get('low'))} – {quantity(rg.get('high'))}"
    if "valueRatio" in r:
        rt = r["valueRatio"]
        return f"{quantity(rt.get('numerator'))} / {quantity(rt.get('denominator'))}"
    if "valuePeriod" in r:
        return period(r["valuePeriod"])
    if "dataAbsentReason" in r:
        return f"– (kein Wert: {cc_full(r['dataAbsentReason'])})"
    return ""


def unit_str(r):
    q = r.get("valueQuantity")
    if not q:
        return ""
    u = q.get("unit") or ""
    c = q.get("code")
    if c and c != u:
        return f"{u} (`{c}`)" if u else f"`{c}`"
    return u


def interpretation(r):
    out = []
    for cc in r.get("interpretation", []):
        for c in cc.get("coding", []):
            code = c.get("code", "")
            label = c.get("display") or INTERPRETATION.get(code, "")
            out.append(f"{code} ({label})" if label else code)
        if not cc.get("coding") and cc.get("text"):
            out.append(cc["text"])
    return ", ".join(out)


def reference_range(r):
    out = []
    for rr in r.get("referenceRange", []):
        lo, hi = rr.get("low"), rr.get("high")
        s = ""
        if lo or hi:
            s = f"{quantity(lo) if lo else ''} – {quantity(hi) if hi else ''}".strip()
        extra = []
        if rr.get("text"):
            extra.append(rr["text"])
        if rr.get("type") and cc_text(rr["type"]) not in ("Normal Range", "normal"):
            extra.append(cc_text(rr["type"]))
        for a in rr.get("appliesTo", []):
            extra.append(cc_text(a))
        if rr.get("age"):
            extra.append("Alter " + f"{quantity(rr['age'].get('low'))} – {quantity(rr['age'].get('high'))}".strip())
        if extra:
            s = (s + " " if s else "") + "(" + "; ".join(extra) + ")"
        if s:
            out.append(s)
    return "<br>".join(out)


def profiles(res):
    return ", ".join(p.rsplit("/", 1)[-1] for p in res.get("meta", {}).get("profile", []))


def ext_coding(coding, url):
    for e in coding.get("extension", []):
        if e.get("url") == url and e.get("valueCoding"):
            return e["valueCoding"].get("code", "")
    return ""


# ---------------------------------------------------------------------------
# XHTML-Narrative -> Markdown (p, b/strong, ul/ol/li, table, br, h1-h6)
# ---------------------------------------------------------------------------
class NarrativeToMarkdown(HTMLParser):
    """Bloecke (Absatz, Liste, Tabelle) werden durch Leerzeilen getrennt."""

    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.blocks = []
        self.items = []        # Eintraege der aktuellen Liste
        self.buf = ""
        self.list_depth = 0
        self.ordered = []
        self.table = None      # Liste von Zeilen (Liste von (is_header, text))
        self.row = None
        self.cell = None
        self.cell_header = False
        self.heading = 0

    # -- Hilfen
    def flush(self):
        t = self.buf.strip()
        if t:
            if self.list_depth and t.lstrip().startswith(("- ", "1. ")):
                self.items.append(t)
            else:
                self.blocks.append(t)
        self.buf = ""

    def end_list(self):
        if self.items:
            self.blocks.append("\n".join(self.items))
            self.items = []

    def write(self, text):
        if self.cell is not None:
            self.cell += text
        else:
            self.buf += text

    # -- Handler
    def handle_starttag(self, tag, attrs):
        if tag in ("p", "div"):
            self.flush()
        elif tag in ("b", "strong"):
            self.write("**")
        elif tag in ("i", "em"):
            self.write("_")
        elif tag in ("ul", "ol"):
            self.flush()
            self.list_depth += 1
            self.ordered.append(tag == "ol")
        elif tag == "li":
            self.flush()
            marker = "1." if self.ordered and self.ordered[-1] else "-"
            self.buf = "  " * (self.list_depth - 1) + marker + " "
        elif tag == "table":
            self.flush()
            self.table = []
        elif tag == "tr":
            self.row = []
        elif tag in ("td", "th"):
            self.cell = ""
            self.cell_header = tag == "th"
        elif tag == "br":
            self.write("<br>" if self.cell is not None else "  \n")
        elif re.fullmatch(r"h[1-6]", tag):
            self.flush()
            self.heading = int(tag[1])
            self.buf = "#" * (self.heading + 2) + " "  # unterhalb der Dokumentstruktur

    def handle_endtag(self, tag):
        if tag in ("p", "div"):
            self.flush()
        elif tag in ("b", "strong"):
            self.write("**")
        elif tag in ("i", "em"):
            self.write("_")
        elif tag == "li":
            self.flush()
        elif tag in ("ul", "ol"):
            self.flush()
            self.list_depth = max(0, self.list_depth - 1)
            if self.ordered:
                self.ordered.pop()
            if self.list_depth == 0:
                self.end_list()
        elif tag in ("td", "th"):
            if self.row is not None and self.cell is not None:
                self.row.append((self.cell_header, self.cell))
            self.cell = None
        elif tag == "tr":
            if self.table is not None and self.row:
                self.table.append(self.row)
            self.row = None
        elif tag == "table":
            self.emit_table()
            self.table = None
        elif re.fullmatch(r"h[1-6]", tag):
            self.flush()
            self.heading = 0

    def handle_data(self, data):
        if self.cell is not None:
            self.cell += data
        else:
            self.buf += re.sub(r"\s+", " ", data)

    def emit_table(self):
        rows = self.table or []
        if not rows:
            return
        width = max(len(r) for r in rows)
        if any(h for h, _ in rows[0]):
            header = [t for _, t in rows[0]] + [""] * (width - len(rows[0]))
            body = rows[1:]
        else:
            header = [f"Spalte {i + 1}" for i in range(width)]
            body = rows
        lines = ["| " + " | ".join(esc(h) for h in header) + " |", "|" + "---|" * width]
        for r in body:
            cells = [t for _, t in r] + [""] * (width - len(r))
            lines.append("| " + " | ".join(esc(c) for c in cells) + " |")
        self.blocks.append("\n".join(lines))

    def result(self):
        self.flush()
        self.end_list()
        return "\n\n".join(self.blocks)


def narrative_md(text):
    div = (text or {}).get("div")
    if not div:
        return ""
    p = NarrativeToMarkdown()
    p.feed(div)
    return p.result()


# ---------------------------------------------------------------------------
# Bundle-Kontext
# ---------------------------------------------------------------------------
class Ctx:
    def __init__(self, bundle, stem):
        self.bundle = bundle
        self.stem = stem
        self.entries = bundle.get("entry", [])
        self.by_ref = {}
        self.by_type = OrderedDict()
        for e in self.entries:
            r = e.get("resource", {})
            if e.get("fullUrl"):
                self.by_ref[e["fullUrl"]] = r
            if r.get("id"):
                self.by_ref[f"{r['resourceType']}/{r['id']}"] = r
                self.by_ref[f"urn:uuid:{r['id']}"] = r
            self.by_type.setdefault(r.get("resourceType", "?"), []).append(r)
        self.roles = self.compute_roles()

    def get(self, t):
        return self.by_type.get(t, [])

    def first(self, t):
        return self.get(t)[0] if self.get(t) else {}

    def resolve(self, ref):
        if not ref:
            return None
        return self.by_ref.get(ref.get("reference", ""))

    def label(self, ref):
        """Kurzbezeichnung einer referenzierten Ressource."""
        if not ref:
            return ""
        r = self.resolve(ref)
        if r is None:
            return ref.get("display") or ref.get("reference", "")
        t = r.get("resourceType")
        if t in ("Patient", "Practitioner", "RelatedPerson"):
            return human_name(r.get("name", [{}])[0]) or ref.get("display", "")
        if t == "Organization":
            return r.get("name") or ref.get("display", "")
        if t == "Specimen":
            ident = ", ".join(i.get("value", "") for i in r.get("identifier", []))
            typ = cc_text(r.get("type"))
            return f"{ident} ({typ})" if ident and typ else ident or typ
        if t == "Observation":
            return cc_text(r.get("code"))
        if t == "Condition":
            return cc_full(r.get("code"))
        if t == "Encounter":
            cls = r.get("class", {})
            return " ".join(x for x in ["Kontakt", cls.get("display") or cls.get("code", ""), period(r.get("period"))] if x)
        if t == "ServiceRequest":
            ident = ", ".join(i.get("value", "") for i in r.get("identifier", []) if i.get("value"))
            return f"Auftrag {ident}" if ident else "Auftrag"
        if t == "DocumentReference":
            return r.get("description") or r.get("content", [{}])[0].get("attachment", {}).get("title", "DocumentReference")
        return ref.get("display") or f"{t}/{r.get('id', '')[:8]}"

    def labels(self, refs):
        return "<br>".join(self.label(x) for x in refs or [])

    def compute_roles(self):
        roles = {}

        def add(ref, role):
            r = self.resolve(ref) if ref else None
            if r is not None:
                roles.setdefault(id(r), []).append(role)

        sr = self.first("ServiceRequest")
        add(sr.get("requester"), "Einsender (anfordernde Person)")
        for p in sr.get("performer", []):
            add(p, "Labor (Auftragsempfaenger)")
        enc = self.first("Encounter")
        add(enc.get("serviceProvider"), "Einsender (Betriebsstaette)")
        for p in enc.get("participant", []):
            add(p.get("individual"), "behandelnde Person")
        comp = self.first("Composition")
        add(comp.get("custodian"), "Verwahrer des Befunds (custodian)")
        for a in comp.get("author", []):
            add(a, "Autor des Befunds")
        dr = self.first("DiagnosticReport")
        for p in dr.get("performer", []):
            add(p, "Befunderstellung (performer)")
        for p in dr.get("resultsInterpreter", []):
            add(p, "Befundfreigabe (resultsInterpreter)")
        return roles

    def role_str(self, r):
        return "<br>".join(OrderedDict.fromkeys(self.roles.get(id(r), [])))


# ---------------------------------------------------------------------------
# Abschnitte
# ---------------------------------------------------------------------------
def kv_table(rows):
    out = ["| Element | Inhalt |", "|---|---|"]
    for k, v in rows:
        if v not in (None, "", []):
            out.append(f"| {esc(k)} | {esc(v)} |")
    return "\n".join(out) + "\n"


def table(headers, rows):
    if not rows:
        return "_keine_\n"
    out = ["| " + " | ".join(headers) + " |", "|" + "---|" * len(headers)]
    for r in rows:
        out.append("| " + " | ".join(esc(c) for c in r) + " |")
    return "\n".join(out) + "\n"


def sec_header(ctx, md):
    b = ctx.bundle
    comp = ctx.first("Composition")
    title = comp.get("title") or ctx.stem
    md.append(f"# {title}\n")
    md.append(f"Quelle: [`{ctx.stem}.bundle.json`]({ctx.stem}.bundle.json) · [Übersicht](README.md)\n")
    counts = Counter(r.get("resourceType") for r in (e.get("resource", {}) for e in ctx.entries))
    md.append(kv_table([
        ("Bundle-ID", b.get("id")),
        ("Profil", profiles(b)),
        ("Typ", b.get("type")),
        ("Identifier", identifiers([b["identifier"]], True) if b.get("identifier") else ""),
        ("Zeitstempel", b.get("timestamp")),
        ("Ressourcen", f"{len(ctx.entries)} (" + ", ".join(f"{t} {n}" for t, n in counts.items()) + ")"),
    ]))


def sec_befund(ctx, md):
    comp = ctx.first("Composition")
    md.append("## Befund\n")
    md.append("### Composition\n")
    md.append(kv_table([
        ("Titel", comp.get("title")),
        ("Profil", profiles(comp)),
        ("Status", comp.get("status")),
        ("Identifier", identifiers([comp["identifier"]], True) if comp.get("identifier") else ""),
        ("Typ", cc_full(comp.get("type"))),
        ("Kategorie", "<br>".join(cc_full(c) for c in comp.get("category", []))),
        ("Datum", comp.get("date")),
        ("Patient", ctx.label(comp.get("subject"))),
        ("Kontakt", ctx.label(comp.get("encounter"))),
        ("Autor", ctx.labels(comp.get("author"))),
        ("Verwahrer", ctx.label(comp.get("custodian"))),
        ("Abschnitte", "<br>".join(s.get("title", "") for s in comp.get("section", []))),
    ]))
    for sr in ctx.get("ServiceRequest"):
        md.append("### Auftrag (ServiceRequest)\n")
        md.append(kv_table([
            ("Identifier", identifiers(sr.get("identifier"), True)),
            ("Status / Intent", f"{sr.get('status', '')} / {sr.get('intent', '')}"),
            ("Kategorie", "<br>".join(cc_full(c) for c in sr.get("category", []))),
            ("Leistung", cc_full(sr.get("code"))),
            ("Anfordernde Person", ctx.label(sr.get("requester"))),
            ("Ausfuehrendes Labor", ctx.labels(sr.get("performer"))),
            ("Angefordert am", sr.get("authoredOn")),
            ("Veranlassungsgruende", ctx.labels(sr.get("reasonReference"))),
            ("Hinweise", "<br>".join(notes(sr))),
        ]))
    for dr in ctx.get("DiagnosticReport"):
        md.append("### DiagnosticReport\n")
        forms = []
        for f in dr.get("presentedForm", []):
            forms.append(attachment_str(f))
        md.append(kv_table([
            ("Identifier", identifiers(dr.get("identifier"), True)),
            ("Status", dr.get("status")),
            ("Kategorie", "<br>".join(cc_full(c) for c in dr.get("category", []))),
            ("Code", cc_full(dr.get("code"))),
            ("Basiert auf", ctx.labels(dr.get("basedOn"))),
            ("Befundzeitpunkt", dr.get("effectiveDateTime") or period(dr.get("effectivePeriod"))),
            ("Freigegeben", dr.get("issued")),
            ("Erstellt von", ctx.labels(dr.get("performer"))),
            ("Freigegeben von", ctx.labels(dr.get("resultsInterpreter"))),
            ("Proben", ctx.labels(dr.get("specimen"))),
            ("Ergebnisse", f"{len(dr.get('result', []))} Observation(s)"),
            ("Beurteilung", dr.get("conclusion")),
            ("Beurteilung (kodiert)", "<br>".join(cc_full(c) for c in dr.get("conclusionCode", []))),
            ("Praesentationsform", "<br>".join(forms)),
        ]))


def attachment_str(a):
    parts = []
    if a.get("title"):
        parts.append(a["title"])
    if a.get("contentType"):
        parts.append(a["contentType"])
    if a.get("data"):
        try:
            n = len(base64.b64decode(a["data"]))
            parts.append(f"eingebettet, {n} Bytes")
        except Exception:
            parts.append("eingebettet")
    elif a.get("url"):
        parts.append(a["url"])
    else:
        parts.append("nur Verweis, kein Inhalt")
    if a.get("creation"):
        parts.append(a["creation"])
    return " · ".join(parts)


def sec_patient(ctx, md):
    for p in ctx.get("Patient"):
        md.append("## Patient\n")
        dec = ""
        if p.get("deceasedBoolean"):
            dec = "ja"
        elif p.get("deceasedDateTime"):
            dec = p["deceasedDateTime"]
        md.append(kv_table([
            ("Name", "<br>".join(human_name(n) + (f" ({n['use']})" if n.get("use") else "") for n in p.get("name", []))),
            ("Profil", profiles(p)),
            ("Identifier", identifiers(p.get("identifier"), True)),
            ("Geschlecht", p.get("gender")),
            ("Geburtsdatum", p.get("birthDate")),
            ("Verstorben", dec),
            ("Aktiv", "ja" if p.get("active") else ("nein" if p.get("active") is False else "")),
            ("Adresse", "<br>".join(address(a) + (f" ({a['type']})" if a.get("type") else "") for a in p.get("address", []))),
            ("Kontakt", telecom(p.get("telecom"))),
        ]))


def sec_beteiligte(ctx, md):
    rows = []
    for r in ctx.get("Practitioner"):
        rows.append(("Practitioner", human_name(r.get("name", [{}])[0]), ctx.role_str(r),
                     identifiers(r.get("identifier"), True), telecom(r.get("telecom")),
                     "<br>".join(address(a) for a in r.get("address", [])), profiles(r)))
    for r in ctx.get("Organization"):
        rows.append(("Organization", r.get("name", ""), ctx.role_str(r),
                     identifiers(r.get("identifier"), True), telecom(r.get("telecom")),
                     "<br>".join(address(a) for a in r.get("address", [])), profiles(r)))
    if rows:
        md.append("## Beteiligte\n")
        md.append(table(["Ressource", "Name", "Rolle im Befund", "Identifier", "Kontakt", "Adresse", "Profil"], rows))


def sec_encounter(ctx, md):
    for e in ctx.get("Encounter"):
        md.append("## Kontakt (Encounter)\n")
        md.append(kv_table([
            ("Status", e.get("status")),
            ("Klasse", cc_full({"coding": [e["class"]]}) if e.get("class") else ""),
            ("Typ", "<br>".join(cc_full(t) for t in e.get("type", []))),
            ("Patient", ctx.label(e.get("subject"))),
            ("Zeitraum", period(e.get("period"))),
            ("Beteiligte", "<br>".join(ctx.label(p.get("individual")) for p in e.get("participant", []))),
            ("Einrichtung", ctx.label(e.get("serviceProvider"))),
            ("Profil", profiles(e)),
        ]))


def sec_diagnosen(ctx, md):
    conds = ctx.get("Condition")
    if not conds:
        return
    md.append("## Diagnosen\n")
    rows = []
    for i, c in enumerate(conds, 1):
        cod = (c.get("code") or {}).get("coding", [{}])[0]
        code = coding_str(cod) if cod.get("code") else ""
        text = (c.get("code") or {}).get("text") or cod.get("display") or "<br>".join(notes(c))
        if (c.get("code") or {}).get("text") and notes(c):
            text += "<br>" + "<br>".join(notes(c))
        rows.append((i, code, ext_coding(cod, EXT_DIAGNOSESICHERHEIT), ext_coding(cod, EXT_SEITENLOKALISATION),
                     text, cc_text(c.get("clinicalStatus")), cc_text(c.get("verificationStatus")),
                     c.get("recordedDate", ""), profiles(c)))
    md.append(table(["#", "Code", "Sicherheit", "Seite", "Bezeichnung / Hinweis", "Klinischer Status",
                     "Verifikation", "Dokumentiert", "Profil"], rows))


def sec_proben(ctx, md):
    specs = ctx.get("Specimen")
    if not specs:
        return
    md.append("## Proben\n")
    rows = []
    for s in specs:
        col = s.get("collection", {})
        rows.append((", ".join(i.get("value", "") for i in s.get("identifier", [])),
                     cc_full(s.get("type")),
                     col.get("collectedDateTime") or period(col.get("collectedPeriod")),
                     s.get("receivedTime", ""),
                     quantity(col.get("quantity")),
                     cc_full(col.get("bodySite")),
                     s.get("status", ""),
                     "<br>".join(notes(s))))
    md.append(table(["Proben-ID", "Material", "Entnahme", "Eingang im Labor", "Menge", "Koerperstelle", "Status", "Hinweise"], rows))


def is_lab(o):
    for c in o.get("category", []):
        for cod in c.get("coding", []):
            if cod.get("code") == "laboratory":
                return True
    return False


def obs_name(o):
    code = o.get("code", {})
    if code.get("text"):
        return code["text"]
    for c in code.get("coding", []):
        if c.get("display"):
            return c["display"]
    return cc_codes(code)


def obs_bereich(o):
    out = []
    for c in o.get("category", []):
        for cod in c.get("coding", []):
            if cod.get("code") != "laboratory":
                out.append(cod.get("display") or cod.get("code", ""))
    return ", ".join(out)


def sec_labor(ctx, md):
    obs = ctx.get("Observation")
    if not obs:
        return
    lab = [o for o in obs if is_lab(o)]
    other = [o for o in obs if not is_lab(o)]
    if lab:
        md.append("## Laborergebnisse\n")
        rows = []
        for i, o in enumerate(lab, 1):
            rows.append((i, obs_name(o), cc_codes(o.get("code")), value_str(o), unit_str(o), interpretation(o),
                         reference_range(o), ctx.label(o.get("specimen")),
                         o.get("effectiveDateTime") or period(o.get("effectivePeriod")), o.get("status", ""),
                         obs_bereich(o)))
        md.append(table(["#", "Untersuchung", "Code", "Ergebnis", "Einheit", "Bewertung", "Referenzbereich",
                         "Probe", "Zeitpunkt", "Status", "Bereich"], rows))
        details = []
        for i, o in enumerate(lab, 1):
            d = obs_details(ctx, o)
            if d:
                details.append(f"**{i}. {obs_name(o)}**\n\n" + d)
        if details:
            md.append("### Details zu einzelnen Ergebnissen\n")
            md.append("\n".join(details))
    if other:
        md.append("## Weitere Beobachtungen\n")
        rows = []
        for o in other:
            rows.append((obs_name(o), cc_codes(o.get("code")), value_str(o), interpretation(o),
                         o.get("effectiveDateTime") or period(o.get("effectivePeriod")), o.get("status", ""),
                         profiles(o)))
        md.append(table(["Beobachtung", "Code", "Wert", "Bewertung", "Zeitpunkt", "Status", "Profil"], rows))
        details = []
        for o in other:
            d = obs_details(ctx, o, minimal=True)
            if d:
                details.append(f"**{obs_name(o)}**\n\n" + d)
        if details:
            md.append("\n".join(details))


def obs_details(ctx, o, minimal=False):
    """Zusatzangaben als Aufzaehlung; minimal=True laesst die Standardangaben weg."""
    lines = []
    if o.get("identifier") and not minimal:
        lines.append(f"- Identifier: {identifiers(o['identifier'])}")
    if o.get("method"):
        lines.append(f"- Methode: {cc_full(o['method'])}")
    if o.get("bodySite"):
        lines.append(f"- Koerperstelle: {cc_full(o['bodySite'])}")
    if o.get("issued") and not minimal:
        lines.append(f"- Freigegeben: {o['issued']}")
    if o.get("performer") and not minimal:
        lines.append(f"- Durchgefuehrt von: {', '.join(ctx.label(p) for p in o['performer'])}")
    if o.get("derivedFrom"):
        lines.append(f"- Abgeleitet von: {', '.join(ctx.label(p) for p in o['derivedFrom'])}")
    if o.get("hasMember"):
        lines.append(f"- Umfasst: {', '.join(ctx.label(p) for p in o['hasMember'])}")
    for n in notes(o):
        lines.append(f"- Hinweis: {n}")
    out = "\n".join(lines)
    if o.get("component"):
        rows = []
        for c in o["component"]:
            rows.append((cc_text(c.get("code")), cc_codes(c.get("code")), value_str(c), interpretation(c),
                         reference_range(c)))
        out += ("\n\n" if out else "") + "Komponenten:\n\n" + table(
            ["Komponente", "Code", "Wert", "Bewertung", "Referenzbereich"], rows)
    return out + ("\n" if out else "")


def sec_medikation(ctx, md):
    ms = ctx.get("MedicationStatement") + ctx.get("MedicationRequest")
    if not ms:
        return
    md.append("## Medikation\n")
    rows = []
    for m in ms:
        med = cc_full(m.get("medicationCodeableConcept")) or ctx.label(m.get("medicationReference"))
        dos = "<br>".join(d.get("text", "") for d in m.get("dosage", []) + m.get("dosageInstruction", []) if d.get("text"))
        rows.append((m["resourceType"], med, m.get("status", ""),
                     period(m.get("effectivePeriod")) or m.get("effectiveDateTime", ""),
                     dos, m.get("dateAsserted") or m.get("authoredOn", ""), "<br>".join(notes(m))))
    md.append(table(["Ressource", "Medikament", "Status", "Zeitraum", "Dosierung", "Erfasst", "Hinweise"], rows))


def sec_anhaenge(ctx, md):
    docs = ctx.get("DocumentReference")
    if not docs:
        return
    md.append("## Anhaenge (DocumentReference)\n")
    rows = []
    for d in docs:
        att = "<br>".join(attachment_str(c.get("attachment", {})) for c in d.get("content", []))
        rows.append((d.get("description", ""), cc_full(d.get("type")), att, d.get("date", ""), d.get("status", "")))
    md.append(table(["Beschreibung", "Dokumenttyp", "Inhalt", "Datum", "Status"], rows))


HANDLED = {"Bundle", "Composition", "ServiceRequest", "DiagnosticReport", "Patient", "Practitioner",
           "Organization", "Encounter", "Condition", "Specimen", "Observation", "MedicationStatement",
           "MedicationRequest", "DocumentReference"}


def sec_sonstige(ctx, md):
    rows = []
    for t, rs in ctx.by_type.items():
        if t in HANDLED:
            continue
        for r in rs:
            summary = r.get("description") or cc_full(r.get("code")) or r.get("name", "") or r.get("title", "")
            rows.append((t, r.get("id", ""), profiles(r), r.get("status", ""), summary))
    if rows:
        md.append("## Sonstige Ressourcen\n")
        md.append(table(["Ressource", "ID", "Profil", "Status", "Inhalt"], rows))


def sec_abschnitte(ctx, md):
    comp = ctx.first("Composition")
    if not comp.get("section"):
        return
    md.append("## Abschnitte der Composition (Narrative)\n")
    md.append("Die generierten Narrative der Composition, aus XHTML nach Markdown uebertragen.\n")
    if comp.get("text"):
        md.append(narrative_md(comp["text"]) + "\n")
    for s in comp["section"]:
        head = s.get("title", "Abschnitt")
        code = cc_codes(s.get("code"))
        md.append(f"### {head}" + (f" ({code})" if code else "") + "\n")
        n = len(s.get("entry", []))
        md.append(f"{n} verknuepfte Ressource(n)" + (": " + ", ".join(ctx.label(e) for e in s.get("entry", [])) if 0 < n <= 8 else "") + "\n")
        body = narrative_md(s.get("text"))
        if body:
            md.append(body + "\n")


def render(path, outdir):
    with open(path, encoding="utf-8") as fh:
        bundle = json.load(fh)
    stem = os.path.basename(path)
    stem = stem[:-len(".bundle.json")] if stem.endswith(".bundle.json") else os.path.splitext(stem)[0]
    ctx = Ctx(bundle, stem)
    ctx.outdir = outdir
    md = []
    sec_header(ctx, md)
    sec_befund(ctx, md)
    sec_patient(ctx, md)
    sec_beteiligte(ctx, md)
    sec_encounter(ctx, md)
    sec_diagnosen(ctx, md)
    sec_proben(ctx, md)
    sec_labor(ctx, md)
    sec_medikation(ctx, md)
    sec_anhaenge(ctx, md)
    sec_sonstige(ctx, md)
    sec_abschnitte(ctx, md)
    md.append("---\n_Generiert mit `bundle2md.py` aus dem Bundle; die JSON-Datei ist massgeblich._\n")
    out = os.path.join(outdir, stem + ".md")
    with open(out, "w", encoding="utf-8") as fh:
        fh.write("\n".join(md))
    return ctx, out


def index_row(ctx):
    comp = ctx.first("Composition")
    pat = ctx.first("Patient")
    conds = [c["code"]["coding"][0].get("code", "")
             for c in ctx.get("Condition") if c.get("code", {}).get("coding")]
    obs = ctx.get("Observation")
    extras = []
    if any(o.get("component") for o in obs):
        extras.append("Antibiogramm/Komponenten")
    if ctx.get("DocumentReference"):
        extras.append("Anhang")
    if ctx.get("MedicationStatement"):
        extras.append("Medikation")
    if any("Schwangerschaft" in profiles(o) for o in obs):
        extras.append("Schwangerschaft")
    if any("vitalsigns" in profiles(o) for o in obs):
        extras.append("Vitalzeichen")
    if any(cod.get("code") == "882-1" for o in obs for cod in o.get("code", {}).get("coding", [])):
        extras.append("Blutgruppe")
    if any("microbiology" in (cc_text(c) or "").lower() or cod.get("code") == "18725-2"
           for o in obs for c in o.get("category", []) for cod in c.get("coding", [])):
        extras.append("Mikrobiologie")
    return (f"[{ctx.stem}.md]({ctx.stem}.md)", f"[JSON]({ctx.stem}.bundle.json)",
            comp.get("title", ""), human_name(pat.get("name", [{}])[0]) if pat else "",
            ", ".join(conds), str(len(obs)), ", ".join(extras))


def update_index(readme, rows):
    if not os.path.exists(readme):
        return False
    with open(readme, encoding="utf-8") as fh:
        text = fh.read()
    if INDEX_START not in text or INDEX_END not in text:
        return False
    body = table(["Markdown", "Bundle", "Titel", "Patient", "Diagnosen (ICD-10-GM)", "Observations", "Besonderheiten"], rows)
    pre, rest = text.split(INDEX_START, 1)
    _, post = rest.split(INDEX_END, 1)
    with open(readme, "w", encoding="utf-8") as fh:
        fh.write(pre + INDEX_START + "\n" + body + "\n" + INDEX_END + post)
    return True


def main(argv):
    outdir = None
    files = []
    i = 0
    while i < len(argv):
        if argv[i] == "--dir":
            outdir = argv[i + 1]
            i += 2
        else:
            files.append(argv[i])
            i += 1
    if outdir is None:
        outdir = os.path.dirname(os.path.abspath(files[0])) if files else os.path.dirname(os.path.abspath(__file__))
    if not files:
        files = sorted(glob.glob(os.path.join(outdir, "*.bundle.json")))
    if not files:
        print("Keine *.bundle.json gefunden.", file=sys.stderr)
        return 1
    rows = []
    for f in files:
        ctx, out = render(f, outdir)
        rows.append(index_row(ctx))
        print(f"{f} -> {out}")
    # Uebersicht nur aktualisieren, wenn alle Bundles des Verzeichnisses verarbeitet wurden
    all_files = sorted(glob.glob(os.path.join(outdir, "*.bundle.json")))
    if sorted(os.path.abspath(f) for f in files) == [os.path.abspath(f) for f in all_files]:
        if update_index(os.path.join(outdir, "README.md"), rows):
            print(f"Uebersicht in {os.path.join(outdir, 'README.md')} aktualisiert ({len(rows)} Bundles)")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
