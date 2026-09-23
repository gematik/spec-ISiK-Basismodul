#!/usr/bin/env python3
"""
LDT 3.2.19 Befund (Satzart 8205) -> ISiK-FHIR-Bundle (ISiK Stufe 6, Basismodul + Labor)

Erzeugt fuer jede Befunddatei ein FHIR-R4-Document-Bundle nach
  https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle
mit Composition (ISiKBerichtSubSysteme), Patient (ISiKPatient), Encounter,
Practitioner (ISiKPersonImGesundheitsberuf), Organization (ISiKOrganisation),
ServiceRequest, DiagnosticReport, Specimen, Condition (ISiKDiagnose) und
Observation (ISiKLaboruntersuchung; Schwangerschaft: ISiKSchwangerschaftsstatus /
ISiKSchwangerschaftErwarteterEntbindungstermin; Koerpermasse: FHIR-Vitalzeichen).

Aufruf:  python3 ldt2isik.py [--out VERZEICHNIS] [--rename ALT=NEU ...] [DATEI.ldt ...]
Ohne Dateiangabe werden alle *.ldt im Verzeichnis mit Satzart 8205 konvertiert.
--rename ersetzt einen Praefix des Dateinamens fuer die Ausgabedatei (die IDs im
Bundle werden weiterhin aus dem Namen der Eingabedatei abgeleitet).
"""
import glob
import html
import json
import os
import re
import sys
import uuid
from datetime import date, datetime
from zoneinfo import ZoneInfo

ENCODING = "iso-8859-15"
UUID_NS = uuid.UUID("6f3f7a3e-2c1a-4b2f-9d2e-ldt3isik0001".replace("ldt3isik", "5a6b7c8d"))
PROFILE = "https://gematik.de/fhir/isik/StructureDefinition/"
LOINC = "http://loinc.org"
SCT = "http://snomed.info/sct"
UCUM = "http://unitsofmeasure.org"
V2_0203 = "http://terminology.hl7.org/CodeSystem/v2-0203"
OBS_CAT = "http://terminology.hl7.org/CodeSystem/observation-category"
OBS_INTERP = "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"
ICD10GM = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
ATC = "http://fhir.de/CodeSystem/bfarm/atc"
PZN = "http://fhir.de/CodeSystem/ifa/pzn"
KDL = "http://dvmd.de/fhir/CodeSystem/kdl"
XDS_TYPE = "http://ihe-d.de/CodeSystems/IHEXDStypeCode"
XDS_CLASS = "http://ihe-d.de/CodeSystems/IHEXDSclassCode"
TZ = ZoneInfo("Europe/Berlin")

# ---------------------------------------------------------------------------
# LOINC-Zuordnung lokaler Test-Idents (FK 8410) bzw. Sonderfaelle.
# Display = offizieller LOINC Long Common Name (validiert gegen tx.fhir.org),
# Bereich = LOINC-Code aus ISiKLaborbereichVS.
# ---------------------------------------------------------------------------
BEREICH = {
    "chem": ("18719-5", "Chemistry studies (set)"),
    "hema": ("18723-7", "Hematology studies (set)"),
    "coag": ("18720-3", "Coagulation studies (set)"),
    "urin": ("18729-4", "Urinalysis studies (set)"),
    "bank": ("18717-9", "Blood bank studies (set)"),
    "sero": ("18727-8", "Serology studies (set)"),
    "tox":  ("18728-6", "Toxicology studies (set)"),
    "tdm":  ("18721-1", "Therapeutic drug monitoring studies (set)"),
    "lab":  ("26436-6", "Laboratory studies (set)"),
}
LOINC_DISPLAY = {
    "2160-0": "Creatinine [Mass/volume] in Serum or Plasma",
    "718-7": "Hemoglobin [Mass/volume] in Blood",
    "24356-8": "Urinalysis complete panel - Urine",
    "2089-1": "Cholesterol in LDL [Mass/volume] in Serum or Plasma",
    "18262-6": "Cholesterol in LDL [Mass/volume] in Serum or Plasma by Direct assay",
    "13457-7": "Cholesterol in LDL [Mass/volume] in Serum or Plasma by calculation",
    "3016-3": "Thyrotropin [Units/volume] in Serum or Plasma",
    "2823-3": "Potassium [Moles/volume] in Serum or Plasma",
    "777-3": "Platelets [#/volume] in Blood by Automated count",
    "9318-7": "Albumin/Creatinine [Mass Ratio] in Urine",
    "2093-3": "Cholesterol [Mass/volume] in Serum or Plasma",
    "2085-9": "Cholesterol in HDL [Mass/volume] in Serum or Plasma",
    "2571-8": "Triglyceride [Mass/volume] in Serum or Plasma",
    "3091-6": "Urea [Mass/volume] in Serum or Plasma",
    "3084-1": "Urate [Mass/volume] in Serum or Plasma",
    "1988-5": "C reactive protein [Mass/volume] in Serum or Plasma",
    "19080-1": "Choriogonadotropin [Units/volume] in Serum or Plasma",
    "4544-3": "Hematocrit [Volume Fraction] of Blood by Automated count",
    "789-8": "Erythrocytes [#/volume] in Blood by Automated count",
    "6690-2": "Leukocytes [#/volume] in Blood by Automated count",
    "6301-6": "INR in Platelet poor plasma by Coagulation assay",
    "1742-6": "Alanine aminotransferase [Enzymatic activity/volume] in Serum or Plasma",
    "1920-8": "Aspartate aminotransferase [Enzymatic activity/volume] in Serum or Plasma",
    "2324-2": "Gamma glutamyl transferase [Enzymatic activity/volume] in Serum or Plasma",
    "62238-1": "Glomerular filtration rate [Volume Rate/Area] in Serum, Plasma or Blood by Creatinine-based formula (CKD-EPI)/1.73 sq M",
    "33914-3": "Glomerular filtration rate [Volume Rate/Area] in Serum or Plasma by Creatinine-based formula (MDRD)/1.73 sq M",
    "4548-4": "Hemoglobin A1c/Hemoglobin.total in Blood",
    "1558-6": "Fasting glucose [Mass/volume] in Serum or Plasma",
    "2345-7": "Glucose [Mass/volume] in Serum or Plasma",
    "3024-7": "Thyroxine (T4) free [Mass/volume] in Serum or Plasma",
    "3051-0": "Triiodothyronine (T3) Free [Mass/volume] in Serum or Plasma",
    "8099-4": "Thyroperoxidase Ab [Units/volume] in Serum or Plasma",
    "12235-8": "Microscopic observation [Identifier] in Urine sediment by Light microscopy",
    "630-4": "Bacteria identified in Urine by Culture",
    "29576-6": "Bacterial susceptibility panel",
    "2777-1": "Phosphate [Mass/volume] in Serum or Plasma",
    "5894-1": "Prothrombin time (PT) actual/Normal",
    "3173-2": "aPTT in Blood by Coagulation assay",
    "3255-7": "Fibrinogen [Mass/volume] in Platelet poor plasma by Coagulation assay",
    "11054-4": "Cholesterol in LDL/Cholesterol in HDL [Mass Ratio] in Serum or Plasma",
    "787-2": "MCV [Entitic mean volume] in Red Blood Cells by Automated count",
    "785-6": "MCH [Entitic mass] by Automated count",
    "786-4": "MCHC [Entitic Mass/volume] in Red Blood Cells by Automated count",
    "1975-2": "Bilirubin.total [Mass/volume] in Serum or Plasma",
    "5643-2": "Ethanol [Mass/volume] in Serum or Plasma",
    "9477-1": "Lead [Mass/volume] in Water",
    "72607-5": "Streptococcus agalactiae [Presence] in Vag+Rectum by Organism specific culture",
    "94500-6": "SARS-CoV-2 (COVID-19) RNA [Presence] in Respiratory system specimen by NAA with probe detection",
    "47527-7": "Cytology report of Cervical or vaginal smear or scraping Cyto stain.thin prep",
    "82675-0": "Human papilloma virus 16+18+31+33+35+39+45+51+52+56+58+59+66+68 DNA [Presence] in Cervix by NAA with probe detection",
    "91851-6": "Human papilloma virus genotype [Identifier] in Genital specimen by NAA with probe detection",
    "47525-1": "Cytology report of Urine Cyto stain",
    "22637-3": "Pathology report final diagnosis Narrative",
    "57021-8": "CBC W Auto Differential panel - Blood",
    "17849-1": "Reticulocytes/Erythrocytes in Blood by Automated count",
    "2951-2": "Sodium [Moles/volume] in Serum or Plasma",
    "2157-6": "Creatine kinase [Enzymatic activity/volume] in Serum or Plasma",
    "20785-2": "Drugs identified in Serum or Plasma by Screen method",
    "12397-6": "Colchicine [Mass/volume] in Serum or Plasma",
    "1989-3": "25-hydroxyvitamin D3 [Mass/volume] in Serum or Plasma",
    "882-1": "ABO and Rh group [Type] in Blood",
    "890-4": "Blood group antibody screen [Presence] in Serum or Plasma",
    "1007-4": "Direct antiglobulin test.polyspecific reagent [Presence] on Red Blood Cells",
    "1250-0": "Major crossmatch [Interpretation]",
    "11502-2": "Laboratory report",
    "2276-4": "Ferritin [Mass/volume] in Serum or Plasma",
    "2502-3": "Iron saturation [Mass Fraction] in Serum or Plasma",
    "6768-6": "Alkaline phosphatase [Enzymatic activity/volume] in Serum or Plasma",
    "8302-2": "Body height",
    "29463-7": "Body weight",
    "82810-3": "Pregnancy status",
    "11779-6": "Delivery date Estimated from last menstrual period",
    "26436-6": "Laboratory studies (set)",
}
# lokaler Ident -> (LOINC, Bereich); Funktion fuer namensabhaengige Faelle
IDENT_LOINC = {
    "KREA": ("2160-0", "chem"), "HB": ("718-7", "hema"), "USTAT": ("24356-8", "urin"),
    "LDL": ("2089-1", "chem"), "TSH": ("3016-3", "chem"), "K": ("2823-3", "chem"),
    "THR": ("777-3", "hema"), "THRO": ("777-3", "hema"), "MALB": ("9318-7", "urin"),
    "ACR": ("9318-7", "urin"), "CHOL": ("2093-3", "chem"), "HDL": ("2085-9", "chem"),
    "TRIG": ("2571-8", "chem"), "HST": ("3091-6", "chem"), "HRNS": ("3084-1", "chem"),
    "CRP": ("1988-5", "chem"), "BHCG": ("19080-1", "chem"), "HK": ("4544-3", "hema"),
    "HKT": ("4544-3", "hema"), "ERY": ("789-8", "hema"), "LEU": ("6690-2", "hema"),
    "LEUK": ("6690-2", "hema"), "INR": ("6301-6", "coag"), "GPT": ("1742-6", "chem"),
    "GOT": ("1920-8", "chem"), "GGT": ("2324-2", "chem"), "GFR": ("62238-1", "chem"),
    "EGFR": ("62238-1", "chem"), "HBA1C": ("4548-4", "chem"), "GLU": ("1558-6", "chem"),
    "FT4": ("3024-7", "chem"), "FT3": ("3051-0", "chem"), "TPOAK": ("8099-4", "sero"),
    "USED": ("12235-8", "urin"), "ABIO": ("630-4", "lab"), "PHOS": ("2777-1", "chem"),
    "QUICK": ("5894-1", "coag"), "TPZ": ("5894-1", "coag"), "APTT": ("3173-2", "coag"),
    "PTT": ("3173-2", "coag"), "FIB": ("3255-7", "coag"), "LDLHDL": ("11054-4", "chem"),
    "MCV": ("787-2", "hema"), "MCH": ("785-6", "hema"), "MCHC": ("786-4", "hema"),
    "BILI": ("1975-2", "chem"), "ETOH": ("5643-2", "tox"), "PB": ("9477-1", "tox"),
    "GBS": ("72607-5", "lab"), "COVPCR": ("94500-6", "lab"), "PAP": ("47527-7", "lab"),
    "HPVHR": ("82675-0", "lab"), "HPVTYP": ("91851-6", "lab"), "URZYT": ("47525-1", "lab"),
    "HISTO": ("22637-3", "lab"), "GBB": ("57021-8", "hema"), "RETI": ("17849-1", "hema"),
    "NA": ("2951-2", "chem"), "CK": ("2157-6", "chem"), "TOXS": ("20785-2", "tox"),
    "COLC": ("12397-6", "tdm"),
}
# LOINC-Codes, die in FK 7365 direkt vorkommen -> Bereich
LOINC_BEREICH = {
    "718-7": "hema", "777-3": "hema", "787-2": "hema", "6690-2": "hema", "17849-1": "hema",
    "630-4": "lab", "5643-2": "tox", "1989-3": "chem",
}
LOINC_FIX = {"VITD": "1989-3"}   # fehlerhafte LOINC-Angaben in FK 7365

UCUM_MAP = {
    "mg/dl": "mg/dL", "g/dl": "g/dL", "%": "%", "U/l": "U/L", "/nl": "/nL",
    "mmol/l": "mmol/L", "mU/l": "mU/L", "ng/ml": "ng/mL", "fl": "fL", "/pl": "/pL",
    "mg": "mg", "ml/min/1.73qm": "mL/min/{1.73_m2}", "g/l": "g/L", "mg/g": "mg/g",
    "mg/l": "mg/L", "ml": "mL", "ng/dl": "ng/dL", "pg/ml": "pg/mL", "s": "s", "pg": "pg",
    "sec": "s", "U/ml": "U/mL", "ml/min": "mL/min", "ug/l": "ug/L", "µg/l": "ug/L",
    "Promille": "[ppth]", "cm": "cm", "kg": "kg", "mmol/mol": "mmol/mol", "umol/l": "umol/L",
    "µmol/l": "umol/L", "mm/h": "mm/h", "IU/l": "[IU]/L", "mIU/l": "m[IU]/L",
}
SPECIMEN_SCT = {
    "SE": ("119364003", "Serum specimen"),
    "ED": ("445295009", "Blood specimen with EDTA"),
    "UR": ("122575003", "Urine specimen"),
    "GW": ("119376003", "Tissue specimen"),
}
GENDER = {"M": "male", "W": "female", "X": "other", "D": "other", "U": "unknown"}
ERGEBNIS_STATUS = {  # FK 8418 (Tabelle E007) -> Observation.status
    "01": "preliminary", "02": "preliminary", "03": "final", "04": "amended",
    "05": "corrected", "06": "final", "07": "amended", "08": "corrected",
    "09": "cancelled", "10": "entered-in-error",
}
INTERP_OK = {"N", "H", "HH", "L", "LL", "A", "AA", "S", "I", "R", "POS", "NEG", "<", ">"}
NACHWEIS = {"0": ("260415000", "Not detected"), "1": ("260373001", "Detected"),
            "2": ("260373001", "Detected")}
SIR = {"S": ("131196009", "Susceptible"), "I": ("264841006", "Intermediately susceptible"),
       "R": ("30714006", "Resistant")}
SIR_INTERP = {"S": "S", "I": "I", "R": "R"}


# ---------------------------------------------------------------------------
# LDT-Parser
# ---------------------------------------------------------------------------
class Node:
    def __init__(self, name, link=None):
        self.name = name          # Obj_xxxx bzw. Satzart
        self.link = link          # FK, ueber die das Objekt eingebunden ist (z.B. 8142)
        self.fields = []          # (fk, value, child|None)

    def get(self, fk, default=None):
        for f, v, c in self.fields:
            if f == fk:
                return v
        return default

    def all(self, fk):
        return [v for f, v, c in self.fields if f == fk]

    def children(self, obj=None, link=None):
        out = []
        for f, v, c in self.fields:
            if c is not None and (obj is None or c.name == obj) and (link is None or f == link):
                out.append(c)
        return out

    def child(self, obj=None, link=None):
        cs = self.children(obj, link)
        return cs[0] if cs else None

    def texts(self, link):
        """Alle 3564-Texte aller Obj_0068 unter dem Link-FK."""
        out = []
        for c in self.children("Obj_0068", link):
            out.extend(c.all("3564"))
        return out

    def walk(self, obj):
        for f, v, c in self.fields:
            if c is not None:
                if c.name == obj:
                    yield c
                yield from c.walk(obj)


def parse_ldt(path):
    raw = open(path, "rb").read().decode(ENCODING)
    lines = [l for l in raw.split("\r\n") if l]
    root = Node("root")
    stack = [root]
    pending_link = None
    for line in lines:
        fk, val = line[3:7], line[7:]
        if fk == "8000":
            n = Node(val, "8000")
            stack[-1].fields.append((fk, val, n))
            stack.append(n)
        elif fk == "8001":
            stack.pop()
        elif fk == "8002":
            n = Node(val, pending_link)
            if pending_link is not None:
                f, v, _ = stack[-1].fields[-1]
                stack[-1].fields[-1] = (f, v, n)
            else:
                stack[-1].fields.append((fk, val, n))
            stack.append(n)
            pending_link = None
        elif fk == "8003":
            stack.pop()
        else:
            stack[-1].fields.append((fk, val, None))
            # Link-FK: naechste Zeile ist 8002
            pending_link = fk
            continue
        pending_link = None
    return root


# ---------------------------------------------------------------------------
# Hilfsfunktionen
# ---------------------------------------------------------------------------
def ts_to_fhir(ts, want_instant=False):
    """Obj_0054 -> FHIR dateTime/instant."""
    if ts is None:
        return None
    d, t, tz = ts.get("7278"), ts.get("7279"), ts.get("7273")
    if not d:
        return None
    iso = f"{d[0:4]}-{d[4:6]}-{d[6:8]}"
    if not t and not want_instant:
        return iso
    t = (t or "000000").ljust(6, "0")
    if tz and re.match(r"UTC[+-]\d{1,2}$", tz):
        off = int(tz[3:])
        offs = f"{'+' if off >= 0 else '-'}{abs(off):02d}:00"
    else:
        dt = datetime(int(d[0:4]), int(d[4:6]), int(d[6:8]), tzinfo=TZ)
        o = dt.utcoffset().total_seconds() / 3600
        offs = f"{'+' if o >= 0 else '-'}{int(abs(o)):02d}:00"
    return f"{iso}T{t[0:2]}:{t[2:4]}:{t[4:6]}{offs}"


def ymd(d):
    return f"{d[0:4]}-{d[4:6]}-{d[6:8]}" if d and len(d) == 8 else None


def ucum(unit):
    if not unit:
        return None
    return UCUM_MAP.get(unit) or "{" + re.sub(r"[{}\s]", "", unit) + "}"


def parse_number(s):
    """'1.3' -> (None, 1.3); '<0.10' -> ('<', 0.1); nicht numerisch -> (None, None)."""
    if s is None:
        return None, None
    s = s.strip().replace(",", ".")
    m = re.match(r"^(<=|>=|<|>)?\s*([-+]?\d+(?:\.\d+)?)$", s)
    if not m:
        return None, None
    v = m.group(2)
    return m.group(1), (int(v) if re.match(r"^[-+]?\d+$", v) else float(v))


def xhtml(body):
    return f'<div xmlns="http://www.w3.org/1999/xhtml">{body}</div>'


def esc(s):
    return html.escape(str(s), quote=False)


def loinc_coding(code, display=None):
    return {"system": LOINC, "code": code, "display": display or LOINC_DISPLAY.get(code, code)}


def quantity(value, unit, comparator=None):
    code = ucum(unit) or "1"
    q = {"value": value, "system": UCUM, "code": code}
    if unit and "{" in code and code not in unit:
        q["unit"] = code          # Annotation muss laut Validator auch in unit stehen
    elif unit:
        q["unit"] = unit
    else:
        q["unit"] = "1"
    if comparator:
        q["comparator"] = comparator
    return q


def narrative(res):
    """Einfacher generierter Narrative-Text (dom-6) fuer alle Ressourcen."""
    t = res["resourceType"]
    def cc(x):
        if not x:
            return ""
        if x.get("text"):
            return x["text"]
        c = x.get("coding", [{}])[0]
        return c.get("display") or c.get("code", "")
    parts = []
    if t == "Patient":
        n = res.get("name", [{}])[0]
        parts = [n.get("text") or n.get("family", ""), f"geb. {res.get('birthDate', '?')}", res.get("gender", "")]
        parts += [f"{i.get('type', {}).get('coding', [{}])[0].get('code', 'ID')}: {i['value']}" for i in res.get("identifier", [])]
    elif t == "Practitioner":
        n = res.get("name", [{}])[0]
        parts = [n.get("text") or n.get("family", "")] + [f"{i.get('type', {}).get('coding', [{}])[0].get('code', 'ID')}: {i['value']}" for i in res.get("identifier", [])]
    elif t == "Organization":
        parts = [res.get("name", "")] + [f"{i.get('type', {}).get('coding', [{}])[0].get('code', 'ID')}: {i['value']}" for i in res.get("identifier", [])]
    elif t == "Encounter":
        parts = ["Ambulanter Kontakt", res.get("period", {}).get("start", "")]
    elif t == "Condition":
        c = res.get("code", {})
        parts = [c.get("coding", [{}])[0].get("code", ""), c.get("text", ""), f"Diagnose vom {res.get('recordedDate', '')}"]
    elif t == "Specimen":
        parts = ["Probe " + res.get("identifier", [{}])[0].get("value", ""), cc(res.get("type")), res.get("collection", {}).get("collectedDateTime", "")]
    elif t == "ServiceRequest":
        parts = ["Laborauftrag"] + [f"{i.get('type', {}).get('coding', [{}])[0].get('code', 'ID')}: {i['value']}" for i in res.get("identifier", [])]
    elif t == "DiagnosticReport":
        parts = [cc(res.get("code")), res.get("identifier", [{}])[0].get("value", ""), res.get("effectiveDateTime", ""), f"{len(res.get('result', []))} Ergebnisse"]
        if res.get("conclusion"):
            parts.append("Beurteilung: " + res["conclusion"])
    elif t == "Observation":
        v = ""
        if "valueQuantity" in res:
            q = res["valueQuantity"]
            v = f"{q.get('comparator', '')}{q['value']} {q.get('unit', '')}"
        elif "valueString" in res:
            v = res["valueString"]
        elif "valueCodeableConcept" in res:
            v = cc(res["valueCodeableConcept"])
        elif "valueDateTime" in res:
            v = res["valueDateTime"]
        elif "component" in res:
            v = "; ".join(cc(c.get("code")) + ": " + (c.get("interpretation", [{}])[0].get("coding", [{}])[0].get("code", "") or cc(c.get("valueCodeableConcept"))) for c in res["component"])
        elif "dataAbsentReason" in res:
            v = "kein Ergebnis (" + cc(res["dataAbsentReason"]) + ")"
        interp = res.get("interpretation", [{}])[0].get("coding", [{}])[0].get("code", "")
        parts = [cc(res.get("code")), v, interp, res.get("effectiveDateTime", ""), res.get("status", "")]
    elif t == "MedicationStatement":
        parts = [cc(res.get("medicationCodeableConcept")), res.get("dosage", [{}])[0].get("text", "")]
    elif t == "DocumentReference":
        a = res.get("content", [{}])[0].get("attachment", {})
        parts = ["Anhang", a.get("title", ""), a.get("contentType", ""), res.get("description", "")]
    else:
        parts = [t]
    body = "<p>" + esc(" | ".join(str(p) for p in parts if p)) + "</p>"
    return {"status": "generated", "div": xhtml(body)}


def person_name(p):
    """Obj_0047 -> HumanName (humanname-de-basis-kompatibel)."""
    if p is None:
        return None
    name = {"use": "official", "family": p.get("3101", "Unbekannt")}
    given = p.all("3102")
    if given:
        name["given"] = given
    prefix = [x for x in (p.get("3104"),) if x]
    if prefix:
        name["prefix"] = prefix
    if p.get("3100") or p.get("3120"):
        ext = []
        if p.get("3100"):
            ext.append({"url": "http://fhir.de/StructureDefinition/humanname-namenszusatz", "valueString": p.get("3100")})
        if p.get("3120"):
            ext.append({"url": "http://hl7.org/fhir/StructureDefinition/humanname-own-prefix", "valueString": p.get("3120")})
        ext.append({"url": "http://hl7.org/fhir/StructureDefinition/humanname-own-name", "valueString": p.get("3101", "")})
        name["_family"] = {"extension": ext}
        parts = [x for x in (p.get("3100"), p.get("3120"), p.get("3101")) if x]
        name["family"] = " ".join(parts)
    name["text"] = " ".join(x for x in (p.get("3104"), " ".join(given), name["family"]) if x)
    return name


def address(a, atype="both"):
    """Obj_0007 -> Address (address-de-basis-kompatibel)."""
    if a is None:
        return None
    street, nr = a.get("3107"), a.get("3109")
    line = " ".join(x for x in (street, nr) if x)
    ext = []
    if street:
        ext.append({"url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName", "valueString": street})
    if nr:
        ext.append({"url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber", "valueString": nr})
    if a.get("3115"):
        ext.append({"url": "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator", "valueString": a.get("3115")})
    lines = [line or a.get("3115") or "-"]
    addr = {"type": atype, "line": lines,
            "city": a.get("3113", "-"), "postalCode": a.get("3112", "-"),
            "country": {"D": "DE"}.get(a.get("3114", "D"), a.get("3114", "DE"))}
    if ext:
        addr["_line"] = [{"extension": ext}]
    if a.get("3115") and line:
        addr["line"].append(a.get("3115"))
        addr["_line"].append(None)
    return addr


def telecom(k):
    """Obj_0031 -> ContactPoint[]"""
    out = []
    if k is None:
        return out
    for fk, system, use in (("7330", "phone", "work"), ("7331", "phone", "mobile"), ("7332", "email", "work"),
                            ("7333", "fax", "work"), ("7335", "email", "work"), ("7334", "url", "work")):
        for v in k.all(fk):
            cp = {"system": system, "value": v}
            if fk == "7332":
                cp["value"] = v
            if use and system != "url":
                cp["use"] = use
            out.append(cp)
    return out


# ---------------------------------------------------------------------------
# Konverter
# ---------------------------------------------------------------------------
LOCAL_CODES = {}   # CodeSystem-URL -> {code: display}


def register_code(system, code, display):
    """Merkt Code und alle vorkommenden Anzeigenamen (Varianten werden Designations)."""
    variants = LOCAL_CODES.setdefault(system, {}).setdefault(code, [])
    if (display or code) not in variants:
        variants.append(display or code)


def canonical_display(system, code, display):
    """Erster registrierter Anzeigename eines lokalen Codes (CodeSystem.concept.display)."""
    register_code(system, code, display)
    return LOCAL_CODES[system][code][0]


def prescan(files):
    """Registriert vorab alle lokalen Codes aller Dateien, damit Codings in allen
    Bundles denselben (kanonischen) Anzeigenamen tragen."""
    for f in files:
        root = parse_ldt(f)
        satz = root.child("8205")
        kopf = root.child("8220")
        if satz is None or kopf is None:
            continue
        bs = next(iter(kopf.walk("Obj_0019")), None)
        ns = f"https://labor-testdaten.example/labor/{(bs.get('0201') if bs else None) or '270719100'}"
        for obj in ("Obj_0060", "Obj_0061", "Obj_0062", "Obj_0063", "Obj_0073"):
            for u in satz.walk(obj):
                if u.get("8410"):
                    register_code(ns + "/CodeSystem/test-ident", u.get("8410"), u.get("8411") or u.get("8410"))
        for ab in satz.walk("Obj_0011"):
            cur = None
            for fk, v, c in ab.fields:
                if fk == "7287":
                    cur = v
                elif fk == "7370" and cur:
                    register_code(ns + "/CodeSystem/antibiotikum", cur, v)


TUMOR_FELDER = {"7364": "Probe", "7372": "Befund", "7373": "Grading", "7374": "Klassifikation",
                "7375": "Diagnosejahr", "7376": "Lokalisation", "7377": "Groesse", "7378": "Beschaffenheit",
                "7379": "Infiltration", "3424": "Therapiebeginn", "3425": "Therapieende", "7429": "DRG-Bezug"}


def tumor_text(u):
    """Obj_0056 Tumor als lesbarer Text (Feldbezeichnung: Wert)."""
    parts = []
    for ff, vv, cc in u.fields:
        if cc is not None or ff == "8167":
            continue
        if ff in ("3424", "3425"):
            vv = ymd(vv) or vv
        label = TUMOR_FELDER.get(ff)
        parts.append(f"{label}: {vv}" if label else vv)
    txt = "Tumor: " + "; ".join(parts)
    free = " ".join(u.texts("8167")).strip()
    return (txt + ". " + free) if free else txt


CS_TITLES = {"antibiotikum": "Lokale Antibiotika-Codes des Labors (Testdaten)",
             "test-ident": "Lokale Untersuchungs-Codes des Labors (Testdaten)"}


def write_codesystems(out_dir):
    """Schreibt die lokalen CodeSystems (Test-Idents, Antibiotika) als FHIR-Ressourcen,
    damit der Validator die lokalen Codes pruefen kann (validate.sh: -ig terminology/)."""
    tdir = os.path.join(out_dir, "terminology")
    os.makedirs(tdir, exist_ok=True)
    for system, codes in sorted(LOCAL_CODES.items()):
        name = system.rsplit("/", 1)[-1]
        cs = {"resourceType": "CodeSystem", "id": "labor-" + name, "url": system, "version": "1.0.0",
              "name": "Labor" + name.title().replace("-", ""), "title": CS_TITLES.get(name, f"Lokale Codes des Labors: {name}"),
              "status": "active", "experimental": True, "content": "complete", "caseSensitive": True,
              "description": "Lokale Codes des fiktiven Labors in den Beispiel-Laborbefunden (synthetische Testdaten, Platzhalter-Namensraum).",
              "count": len(codes),
              "concept": []}
        for c, variants in sorted(codes.items()):
            concept = {"code": c, "display": variants[0]}
            if len(variants) > 1:
                concept["designation"] = [{"value": v} for v in variants[1:]]
            cs["concept"].append(concept)
        with open(os.path.join(tdir, f"CodeSystem-{name}.json"), "w", encoding="utf-8") as fh:
            json.dump(cs, fh, ensure_ascii=False, indent=2)
            fh.write("\n")


class Converter:
    def __init__(self, path):
        self.path = path
        self.stem = os.path.splitext(os.path.basename(path))[0]
        self.root = parse_ldt(path)
        self.entries = []
        self.refs = {}
        self.obs_refs = []        # Referenzen aller Laborergebnisse in Reihenfolge
        self.obs_rows = []        # Narrative-Zeilen
        self.hinweise = []        # Fehlermeldung/Aufmerksamkeit etc.
        self.satz_8220 = self.root.child("8220")
        self.satz_8205 = self.root.child("8205")
        if self.satz_8205 is None:
            raise ValueError(f"{path}: kein Satz 8205 (Befund)")
        self.lab_bsnr = "000000000"
        self.praxis_bsnr = "000000000"

    # --- Infrastruktur ------------------------------------------------------
    def uid(self, key):
        return str(uuid.uuid5(UUID_NS, f"{self.stem}|{key}"))

    def add(self, key, resource):
        rid = self.uid(key)
        resource["id"] = rid
        # id zuerst, dann Rest (nur kosmetisch)
        ordered = {"resourceType": resource["resourceType"], "id": rid}
        if "meta" in resource:
            ordered["meta"] = resource["meta"]
        if "text" not in resource:
            ordered["text"] = narrative(resource)
        for k, v in resource.items():
            if k not in ordered:
                ordered[k] = v
        self.entries.append({"fullUrl": f"urn:uuid:{rid}", "resource": ordered})
        self.refs[key] = f"urn:uuid:{rid}"
        return ordered

    def ref(self, key, display=None):
        r = {"reference": self.refs[key]}
        if display:
            r["display"] = display
        return r

    # --- Stammdaten ----------------------------------------------------------
    def build_lab(self):
        lk = next(iter(self.satz_8220.walk("Obj_0036")), None)
        bs = next(iter(self.satz_8220.walk("Obj_0019")), None)
        org = bs.child("Obj_0043") if bs else None
        self.lab_bsnr = (bs.get("0201") if bs else None) or "270719100"
        self.lab_ns = f"https://labor-testdaten.example/labor/{self.lab_bsnr}"
        name = (bs.get("0203") if bs else None) or (org.get("1250") if org else None) or "Labor"
        o = {"resourceType": "Organization", "meta": {"profile": [PROFILE + "ISiKOrganisation"]},
             "identifier": [{"use": "official", "type": {"coding": [{"system": V2_0203, "code": "BSNR"}]},
                             "system": "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR", "value": self.lab_bsnr}],
             "active": True,
             "type": [{"coding": [{"system": "http://terminology.hl7.org/CodeSystem/organization-type", "code": "prov", "display": "Healthcare Provider"}]}],
             "name": name}
        iknr = bs.get("0213") if bs else None
        if iknr and re.match(r"^\d{9}$", iknr):
            o["identifier"].append({"use": "official", "type": {"coding": [{"system": V2_0203, "code": "XX"}]},
                                    "system": "http://fhir.de/sid/arge-ik/iknr", "value": iknr})
        src_org = org or (lk.child("Obj_0043", "8239") if lk else None)
        if src_org:
            tel = telecom(src_org.child("Obj_0031"))
            if tel:
                o["telecom"] = tel
            adr = address(src_org.child("Obj_0007", "8229"))
            if adr:
                o["address"] = [adr]
        self.add("org-lab", o)
        # Laborarzt (Laborleitung)
        lab_desc = (lk.child("Obj_0043", "8239") if lk else None) or org
        person = lab_desc.child("Obj_0047") if lab_desc else None
        pr = {"resourceType": "Practitioner", "meta": {"profile": [PROFILE + "ISiKPersonImGesundheitsberuf"]}}
        if person is not None:
            nm = person_name(person)
        else:
            nm = {"use": "official", "family": "Laborarzt", "given": ["-"], "text": "Laborarzt"}
        ini = (person.get("8990") if person else None) or re.sub(r"[^A-Za-z]", "", nm.get("family", "")).upper()[:6]
        pr["identifier"] = [{"type": {"coding": [{"system": V2_0203, "code": "EN"}]},
                             "system": self.lab_ns + "/sid/mitarbeiter", "value": ini or "LAB"}]
        pr["name"] = [nm]
        self.lab_doctor_name = nm["text"]
        self.add("prac-lab", pr)

    def build_sender(self):
        eid = self.satz_8205.child("Obj_0022")
        arzt = eid.child("Obj_0014") if eid else None
        bs = eid.child("Obj_0019") if eid else None
        org = bs.child("Obj_0043") if bs else None
        self.praxis_bsnr = (bs.get("0201") if bs else None) or "000000000"
        self.praxis_ns = f"https://labor-testdaten.example/praxis/{self.praxis_bsnr}"
        name = (bs.get("0203") if bs else None) or (org.get("1250") if org else None) or "Einsender"
        o = {"resourceType": "Organization", "meta": {"profile": [PROFILE + "ISiKOrganisation"]},
             "identifier": [{"use": "official", "type": {"coding": [{"system": V2_0203, "code": "BSNR"}]},
                             "system": "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_BSNR", "value": self.praxis_bsnr}],
             "active": True,
             "type": [{"coding": [{"system": "http://terminology.hl7.org/CodeSystem/organization-type", "code": "prov", "display": "Healthcare Provider"}]}],
             "name": name}
        if org:
            tel = telecom(org.child("Obj_0031"))
            if tel:
                o["telecom"] = tel
            adr = address(org.child("Obj_0007", "8229"))
            if adr:
                o["address"] = [adr]
        self.add("org-praxis", o)
        person = arzt.child("Obj_0047") if arzt else None
        lanr = arzt.get("0212") if arzt else None
        pr = {"resourceType": "Practitioner", "meta": {"profile": [PROFILE + "ISiKPersonImGesundheitsberuf"]}}
        ids = []
        if lanr and re.match(r"^\d{9}$", lanr):
            ids.append({"use": "official", "type": {"coding": [{"system": V2_0203, "code": "LANR"}]},
                        "system": "https://fhir.kbv.de/NamingSystem/KBV_NS_Base_ANR", "value": lanr})
        else:
            ids.append({"type": {"coding": [{"system": V2_0203, "code": "EN"}]},
                        "system": self.praxis_ns + "/sid/mitarbeiter", "value": eid.get("8312", "EINSENDER") if eid else "EINSENDER"})
        pr["identifier"] = ids
        nm = person_name(person) if person is not None else {"use": "official", "family": "Einsender", "given": ["-"], "text": "Einsender"}
        pr["name"] = [nm]
        self.sender_name = nm["text"]
        self.add("prac-sender", pr)

    def build_patient(self):
        pat = self.satz_8205.child("Obj_0045")
        person = pat.child("Obj_0047") if pat else None
        p = {"resourceType": "Patient", "meta": {"profile": [PROFILE + "ISiKPatient"]}}
        ids = []
        pid = pat.get("3000") if pat else None
        ids.append({"type": {"coding": [{"system": V2_0203, "code": "MR"}]},
                    "system": self.praxis_ns + "/sid/patienten-id", "value": pid or "unbekannt"})
        kvnr = pat.get("3119") if pat else None
        if kvnr and re.match(r"^[A-Z][0-9]{9}$", kvnr):
            ids.append({"type": {"coding": [{"system": "http://fhir.de/CodeSystem/identifier-type-de-basis", "code": "KVZ10"}]},
                        "system": "http://fhir.de/sid/gkv/kvid-10", "value": kvnr})
        p["identifier"] = ids
        p["active"] = True
        nm = person_name(person) if person is not None else {"use": "official", "family": "Unbekannt", "given": ["-"]}
        p["name"] = [nm]
        geb = person.get("3103") if person else None
        sex = (person.get("3110") if person else None) or "U"
        p["gender"] = GENDER.get(sex, "unknown")
        if sex in ("X", "D"):
            p["_gender"] = {"extension": [{"url": "http://fhir.de/StructureDefinition/gender-amtlich-de",
                                            "valueCoding": {"system": "http://fhir.de/CodeSystem/gender-amtlich-de", "code": sex}}]}
        if geb:
            p["birthDate"] = ymd(geb)
        else:
            p["_birthDate"] = {"extension": [{"url": "http://hl7.org/fhir/StructureDefinition/data-absent-reason", "valueCode": "unknown"}]}
        if pat and pat.get("7922"):
            p["deceasedDateTime"] = ymd(pat.get("7922"))
        if person:
            tel = telecom(person.child("Obj_0031", "8232"))
            if tel:
                p["telecom"] = tel
            adrs = []
            wa = address(person.child("Obj_0007", "8228"))
            if wa:
                adrs.append(wa)
            if adrs:
                p["address"] = adrs
        self.patient_display = nm.get("text")
        self.add("patient", p)
        return pat

    def build_encounter(self, start):
        e = {"resourceType": "Encounter", "status": "finished",
             "class": {"system": "http://terminology.hl7.org/CodeSystem/v3-ActCode", "code": "AMB", "display": "ambulatory"},
             "subject": self.ref("patient"),
             "participant": [{"individual": self.ref("prac-sender", self.sender_name)}],
             "serviceProvider": self.ref("org-praxis")}
        if start:
            e["period"] = {"start": start}
        self.add("encounter", e)

    # --- Diagnosen -----------------------------------------------------------
    def build_conditions(self, recorded):
        keys = []
        vg = self.satz_8205.child("Obj_0027")
        if vg is None:
            return keys
        for i, dg in enumerate(vg.children("Obj_0100")):
            key = f"cond-{i}"
            code = {}
            icd = dg.get("6001")
            if icd:
                coding = {"system": ICD10GM, "version": recorded[:4], "code": icd}
                ext = []
                if dg.get("6003"):
                    ext.append({"url": "http://fhir.de/StructureDefinition/icd-10-gm-diagnosesicherheit",
                                "valueCoding": {"system": "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_DIAGNOSESICHERHEIT", "code": dg.get("6003")}})
                if dg.get("6004"):
                    ext.append({"url": "http://fhir.de/StructureDefinition/seitenlokalisation",
                                "valueCoding": {"system": "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_ICD_SEITENLOKALISATION", "code": dg.get("6004")}})
                if ext:
                    coding["extension"] = ext
                code["coding"] = [coding]
            if dg.get("4207"):
                code["text"] = dg.get("4207")
            if not code:
                continue
            c = {"resourceType": "Condition", "meta": {"profile": [PROFILE + "ISiKDiagnose"]},
                 "code": code, "subject": self.ref("patient"), "encounter": self.ref("encounter"),
                 "recordedDate": recorded}
            # Diagnosesicherheit (FK 6003): G gesichert, V Verdacht, Z Zustand nach, A Ausschluss
            sich = dg.get("6003", "")
            clin = {"G": "active", "V": "active", "Z": "resolved", "": "active"}.get(sich)
            veri = {"G": "confirmed", "V": "provisional", "Z": "confirmed", "A": "refuted"}.get(sich)
            if clin:
                c["clinicalStatus"] = {"coding": [{"system": "http://terminology.hl7.org/CodeSystem/condition-clinical", "code": clin}]}
            if veri:
                c["verificationStatus"] = {"coding": [{"system": "http://terminology.hl7.org/CodeSystem/condition-ver-status", "code": veri}]}
            notes = [t for t in (dg.get("6006"), dg.get("6008")) if t]
            if notes:
                c["note"] = [{"text": t} for t in notes]
            self.add(key, c)
            keys.append(key)
        return keys

    # --- Material ------------------------------------------------------------
    def build_specimens(self):
        keys = {}
        first_collect = None
        for i, m in enumerate(self.satz_8205.children("Obj_0037")):
            ident = m.get("7364") or f"M{i}"
            key = f"spec-{ident}"
            typ = {"text": m.get("8430") or m.get("8428") or ident}
            sct = SPECIMEN_SCT.get(m.get("8428", ""))
            if sct and m.get("7310", "1") == "1":
                typ["coding"] = [{"system": SCT, "code": sct[0], "display": sct[1]}]
            s = {"resourceType": "Specimen", "status": "available",
                 "identifier": [{"system": self.lab_ns + "/sid/probe-id", "value": ident}],
                 "type": typ, "subject": self.ref("patient")}
            rec = ts_to_fhir(m.child("Obj_0054", "8220"))
            if rec:
                s["receivedTime"] = rec
            coll = {}
            ct = ts_to_fhir(m.child("Obj_0054", "8219"))
            if ct:
                coll["collectedDateTime"] = ct
                d = ct[:10]
                first_collect = d if first_collect is None or d < first_collect else first_collect
            if m.get("7292"):
                coll["bodySite"] = {"text": m.get("7292")}
            if m.get("8520"):
                cmp_, val = parse_number(m.get("8520"))
                if val is not None:
                    coll["quantity"] = quantity(val, m.get("8421"))
            if coll:
                s["collection"] = coll
            notes = []
            if m.get("8431"):
                notes.append(m.get("8431"))
            notes += m.all("7318")
            notes += m.texts("8167")
            for fm in m.children("Obj_0026"):
                notes.append("Aufmerksamkeit: " + " ".join(fm.texts("8167")))
            if notes:
                s["note"] = [{"text": t} for t in notes]
            self.add(key, s)
            keys[ident] = key
        self.specimen_keys = keys
        return first_collect

    # --- Ergebnisse ----------------------------------------------------------
    def obs_base(self, key, code_cc, bereich, effective, issued, status="final", specimen_ident=None, namenskennung=None, ident_value=None):
        o = {"resourceType": "Observation", "meta": {"profile": [PROFILE + "ISiKLaboruntersuchung"]}}
        if ident_value:
            o["identifier"] = [{"type": {"coding": [{"system": V2_0203, "code": "OBI"}]},
                                "system": self.lab_ns + "/sid/ergebnis-id", "value": ident_value}]
        o["status"] = status
        cats = [{"coding": [{"system": OBS_CAT, "code": "laboratory", "display": "Laboratory"}]}]
        if bereich:
            b = BEREICH[bereich]
            cats.append({"coding": [{"system": LOINC, "code": b[0], "display": b[1]}]})
        o["category"] = cats
        o["code"] = code_cc
        o["subject"] = self.ref("patient")
        o["encounter"] = self.ref("encounter")
        o["effectiveDateTime"] = effective
        if issued:
            o["issued"] = issued
        perf = [self.ref("prac-lab", namenskennung or self.lab_doctor_name), self.ref("org-lab")]
        o["performer"] = perf
        if specimen_ident and specimen_ident in self.specimen_keys:
            o["specimen"] = self.ref(self.specimen_keys[specimen_ident])
        return o

    def code_for(self, u):
        """CodeableConcept mit LOINC-Slice + lokalem Code."""
        ident, name = u.get("8410"), u.get("8411")
        loinc, bereich = None, None
        if u.get("7365") and (u.get("7251", "").upper() == "LOINC" or u.get("7260") == "1"):
            loinc = LOINC_FIX.get(u.get("7365"), u.get("7365"))
            name = name or u.get("7366")
            bereich = LOINC_BEREICH.get(loinc, "chem")
        elif ident and ident in IDENT_LOINC:
            loinc, bereich = IDENT_LOINC[ident]
            n = (name or "").lower()
            if ident == "LDL" and "direkt" in n:
                loinc = "18262-6"
            elif ident == "LDL" and "berechnet" in n:
                loinc = "13457-7"
            elif ident == "GFR" and "mdrd" in n:
                loinc = "33914-3"
        codings = []
        if loinc:
            codings.append(loinc_coding(loinc))
        if ident:
            codings.append({"system": self.lab_ns + "/CodeSystem/test-ident", "code": ident,
                            "display": canonical_display(self.lab_ns + "/CodeSystem/test-ident", ident, name or ident)})
        if not loinc:
            # Kein LOINC bekannt: ISiKLaboruntersuchung verlangt einen LOINC-Slice.
            codings.insert(0, loinc_coding("26436-6"))
            bereich = bereich or "lab"
        cc = {"coding": codings}
        if name or u.get("7366"):
            cc["text"] = name or u.get("7366")
        return cc, bereich, loinc

    def add_notes(self, o, texts):
        texts = [t for t in texts if t]
        if texts:
            o.setdefault("note", []).extend({"text": t} for t in texts)

    def collect_hinweise(self, u, label):
        for fm in u.children("Obj_0026"):
            txt = " ".join(fm.texts("8167"))
            recall = fm.child("Obj_0054", "8154")
            if recall is not None:
                txt += f" (Termin {ymd(recall.get('7278'))}{': ' + recall.get('7272') if recall.get('7272') else ''})"
            note = f"Hinweis zu {label}: {txt}".strip()
            self.hinweise.append(note)
            yield note

    def build_result_common(self, key, u, label):
        """Gemeinsame Felder fuer Obj_0060/0061/0062/0063/0073."""
        eff = ts_to_fhir(u.child("Obj_0054", "8225")) or self.befund_dt
        issued = ts_to_fhir(u.child("Obj_0054", "8223"), want_instant=True) or self.befund_instant
        status = ERGEBNIS_STATUS.get(u.get("8418", "06"), "final")
        nk = u.child("Obj_0041", "8141")
        cc, bereich, loinc = self.code_for(u)
        o = self.obs_base(key, cc, bereich, eff, issued, status=status, specimen_ident=u.get("7364"),
                          namenskennung=nk.get("7358") if nk else None,
                          ident_value=f"{self.befund_id}-{u.get('7304')}" if u.get("7304") else None)
        interp = u.get("8422")
        notes = u.texts("8236") + u.texts("8237") + u.texts("8167")
        notes += list(self.collect_hinweise(u, label))
        if u.get("7429"):
            notes.append("DRG: " + u.get("7429"))
        methods = u.all("7302")
        if methods:
            o["method"] = {"text": "; ".join(methods)}
        return o, interp, notes, status

    def build_klinische_chemie(self, u, idx):
        key = f"obs-{idx}"
        label = u.get("8411") or u.get("7366") or u.get("8410") or key
        o, interp, notes, status = self.build_result_common(key, u, label)
        val = u.get("8420")
        unit = u.get("8421")
        cmp_, num = parse_number(val) if u.get("7306", "01") in ("01", "02") else (None, None)
        if num is not None:
            o["valueQuantity"] = quantity(num, unit, cmp_)
        elif val:
            o["valueString"] = val
        elif status not in ("cancelled", "registered"):
            o["dataAbsentReason"] = {"coding": [{"system": "http://terminology.hl7.org/CodeSystem/data-absent-reason", "code": "not-performed"}]}
        # Normalwerte
        rr = []
        for nw in u.children("Obj_0042"):
            r = {}
            lo, hi = nw.get("8461"), nw.get("8462")
            nunit = nw.get("8421") or unit
            c1, l = parse_number(lo)
            c2, h = parse_number(hi)
            if l is not None:
                r["low"] = quantity(l, nunit)
            if h is not None:
                r["high"] = quantity(h, nunit)
            if nw.get("8460"):
                r["text"] = nw.get("8460")
            r["type"] = {"coding": [{"system": "http://terminology.hl7.org/CodeSystem/referencerange-meaning", "code": "normal", "display": "Normal Range"}]}
            if nw.get("8424") == "22":
                r["appliesTo"] = [{"text": "Alter und Geschlecht"}]
            extra = nw.texts("8167")
            if extra:
                r["text"] = (r.get("text", "") + " " + " ".join(extra)).strip()
            if not interp:
                interp = nw.get("8422")
            if len(r) > 1:
                rr.append(r)
        if rr:
            o["referenceRange"] = rr
        if interp and interp in INTERP_OK:
            o["interpretation"] = [{"coding": [{"system": OBS_INTERP, "code": interp}]}]
        self.add_notes(o, notes)
        self.add(key, o)
        self.obs_refs.append(key)
        disp = val or ""
        self.obs_rows.append((label, disp, unit or "", interp or "", "; ".join(nw.get("8460") or f"{nw.get('8461','')} - {nw.get('8462','')}" for nw in u.children("Obj_0042"))))
        # Sonderfall: eingebettete BAK (Obj_0072) gibt es nur in Obj_0061

    def build_mikrobiologie(self, u, idx):
        key = f"obs-{idx}"
        label = u.get("8411") or u.get("8410") or key
        o, interp, notes, status = self.build_result_common(key, u, label)
        keime = u.all("7355")
        nachweis = u.get("7301")
        if nachweis in NACHWEIS:
            vc = {"coding": [{"system": SCT, "code": NACHWEIS[nachweis][0], "display": NACHWEIS[nachweis][1]}]}
            if keime:
                vc["text"] = ", ".join(keime) + (" (nachgewiesen)" if nachweis != "0" else " (nicht nachgewiesen)")
            o["valueCodeableConcept"] = vc
        elif keime:
            o["valueString"] = ", ".join(keime)
        for k in ("7357", "7293", "7361", "7356", "7285"):
            pass
        if u.get("7357"):
            notes.append("Wachstum/Menge: " + u.get("7357") + (" " + u.get("7293") if u.get("7293") else ""))
        if u.get("8434"):
            notes.append(u.get("8434"))
        if interp and interp in INTERP_OK:
            o["interpretation"] = [{"coding": [{"system": OBS_INTERP, "code": interp}]}]
        self.add_notes(o, notes)
        self.add(key, o)
        self.obs_refs.append(key)
        self.obs_rows.append((label, ", ".join(keime) or "", "", "", ""))
        # Antibiogramm
        for j, ab in enumerate(u.children("Obj_0011")):
            akey = f"{key}-abio-{j}"
            eff = o["effectiveDateTime"]
            cc = {"coding": [loinc_coding("29576-6")], "text": "Antibiogramm" + (f" ({', '.join(keime)})" if keime else "")}
            a = self.obs_base(akey, cc, "lab", eff, o.get("issued"), status=status, specimen_ident=u.get("7364"),
                              ident_value=f"{self.befund_id}-{u.get('7304')}-AB{j+1}" if u.get("7304") else None)
            a["derivedFrom"] = [self.ref(key)]
            comps = []
            rows = []
            # Felder gruppieren: jede Wirkstoffzeile beginnt mit 7287
            cur = None
            groups = []
            for f, v, c in ab.fields:
                if f == "7287":
                    cur = {"7287": v}
                    groups.append(cur)
                elif cur is not None and c is None:
                    cur.setdefault(f, v)
            for g in groups:
                codings = []
                if g.get("7288"):
                    codings.append({"system": ATC, "code": g["7288"]})
                codings.append({"system": self.lab_ns + "/CodeSystem/antibiotikum", "code": g["7287"],
                                "display": canonical_display(self.lab_ns + "/CodeSystem/antibiotikum", g["7287"], g.get("7370", g["7287"]))})
                comp = {"code": {"coding": codings, "text": g.get("7370", g["7287"])}}
                cmp_, mhk = parse_number(g.get("7289"))
                sir = g.get("7367")
                if mhk is not None:
                    comp["valueQuantity"] = quantity(mhk, g.get("7369") or "mg/l", cmp_)
                elif sir in SIR:
                    comp["valueCodeableConcept"] = {"coding": [{"system": SCT, "code": SIR[sir][0], "display": SIR[sir][1]}]}
                else:
                    comp["dataAbsentReason"] = {"coding": [{"system": "http://terminology.hl7.org/CodeSystem/data-absent-reason", "code": "unknown"}]}
                if sir in SIR_INTERP:
                    comp["interpretation"] = [{"coding": [{"system": OBS_INTERP, "code": SIR_INTERP[sir]}]}]
                comps.append(comp)
                rows.append((g.get("7370", g["7287"]), g.get("7289", ""), g.get("7369", ""), sir or ""))
            a["component"] = comps
            an = ab.texts("8237")
            if any(x == "2" for x in ab.all("7424")):
                an.append("Bewertung nach EUCAST.")
            self.add_notes(a, an)
            if u.get("7286"):
                a["method"] = {"text": {"1": "Agardiffusion", "2": "MHK-Bestimmung", "0": "kein Antibiogramm"}.get(u.get("7286"), "FK 7286=" + u.get("7286"))}
            self.add(akey, a)
            self.obs_refs.append(akey)
            self.obs_rows.append(("Antibiogramm", "; ".join(f"{r[0]}: {r[3]} (MHK {r[1]} {r[2]})" for r in rows), "", "", ""))
        # BAK (Obj_0072) - schemabedingt an Obj_0061 gebunden
        for j, bak in enumerate(u.children("Obj_0072")):
            bkey = f"{key}-bak-{j}"
            cc = {"coding": [loinc_coding("5643-2")], "text": "Blutalkoholkonzentration (BAK)"}
            b = self.obs_base(bkey, cc, "tox", o["effectiveDateTime"], o.get("issued"), status=status,
                              ident_value=f"{self.befund_id}-{u.get('7304')}-BAK" if u.get("7304") else None)
            cmp_, num = parse_number(bak.get("8420"))
            if num is not None:
                b["valueQuantity"] = quantity(num, bak.get("8421"), cmp_)
            else:
                b["valueString"] = bak.get("8420", "")
            bn = bak.texts("8245") + bak.texts("8237") + bak.texts("8246")
            rr = []
            for nw in bak.children("Obj_0042"):
                r = {}
                c2, h = parse_number(nw.get("8462"))
                if h is not None:
                    r["high"] = quantity(h, nw.get("8421") or bak.get("8421"))
                if nw.get("8460"):
                    r["text"] = nw.get("8460")
                if nw.get("8422") and nw.get("8422") in INTERP_OK:
                    b["interpretation"] = [{"coding": [{"system": OBS_INTERP, "code": nw.get("8422")}]}]
                if r:
                    rr.append(r)
            if rr:
                b["referenceRange"] = rr
            self.add_notes(b, bn)
            self.add(bkey, b)
            self.obs_refs.append(bkey)
            self.obs_rows.append(("Blutalkoholkonzentration", bak.get("8420", ""), bak.get("8421", ""), "", ""))

    def build_textbefund(self, u, idx, art):
        """Obj_0062 (Zervix-Zytologie), Obj_0063 (Zytologie), Obj_0073 (Sonstige)."""
        key = f"obs-{idx}"
        label = u.get("8411") or u.get("8410") or key
        o, interp, notes, status = self.build_result_common(key, u, label)
        texts = u.texts("8237")
        if status == "cancelled":
            o["dataAbsentReason"] = {"coding": [{"system": "http://terminology.hl7.org/CodeSystem/data-absent-reason", "code": "not-performed"}]}
            notes = texts + notes
        else:
            value = " ".join(texts) if texts else None
            if u.name == "Obj_0062" and u.get("7414"):
                o["valueCodeableConcept"] = {"text": f"Muenchner Nomenklatur III: Gruppe {u.get('7414')}"}
                if value:
                    notes.insert(0, value)
            elif value:
                o["valueString"] = value
            else:
                o["dataAbsentReason"] = {"coding": [{"system": "http://terminology.hl7.org/CodeSystem/data-absent-reason", "code": "unknown"}]}
        # Krebsfrueherkennung Obj_0034: nur die Freitexte, die Einzelfelder des
        # Musters 39 sind ohne Formularkontext nicht sinnvoll darstellbar
        for kf in u.children("Obj_0034"):
            kft = " ".join(kf.texts("8167")).strip()
            notes.append("Krebsfrueherkennung Zervix-Karzinom (Ko-Test)" + (": " + kft if kft else ""))
        if interp and interp in INTERP_OK:
            o["interpretation"] = [{"coding": [{"system": OBS_INTERP, "code": interp}]}]
        self.add_notes(o, notes)
        self.add(key, o)
        self.obs_refs.append(key)
        self.obs_rows.append((label, (" ".join(texts))[:160], "", interp or "", ""))

    def build_blutgruppe(self, u, idx):
        base = f"obs-{idx}"
        eff = ts_to_fhir(u.child("Obj_0054", "8225")) or self.befund_dt
        issued = ts_to_fhir(u.child("Obj_0054", "8223"), want_instant=True) or self.befund_instant
        status = ERGEBNIS_STATUS.get(u.get("8418", "06"), "final")
        spec = u.get("7364")
        notes_common = u.texts("8167") + list(self.collect_hinweise(u, "Blutgruppenzugehoerigkeit"))
        idv = f"{self.befund_id}-{u.get('7304')}" if u.get("7304") else None
        # ABO/Rh
        o = self.obs_base(base + "-abo", {"coding": [loinc_coding("882-1")], "text": "Blutgruppe (AB0/RhD)"}, "bank", eff, issued, status, spec, ident_value=idv and idv + "-ABO")
        o["valueCodeableConcept"] = {"text": u.get("3412", "unbekannt")}
        n = [x for x in (u.get("3414"), u.get("3416")) if x] + notes_common
        if u.get("7263"):
            n.append("Test-ID: " + u.get("7263"))
        self.add_notes(o, n)
        self.add(base + "-abo", o)
        self.obs_refs.append(base + "-abo")
        self.obs_rows.append(("Blutgruppe", u.get("3412", ""), "", "", u.get("3414", "")))
        # Antikoerpersuchtest 3413: 1 = positiv, 2 = negativ (E054)
        if u.get("3413"):
            o = self.obs_base(base + "-aks", {"coding": [loinc_coding("890-4")], "text": "Antikoerpersuchtest"}, "bank", eff, issued, status, spec, ident_value=idv and idv + "-AKS")
            m = {"1": ("260373001", "Detected", "POS"), "2": ("260415000", "Not detected", "NEG")}.get(u.get("3413"))
            if m:
                o["valueCodeableConcept"] = {"coding": [{"system": SCT, "code": m[0], "display": m[1]}]}
                o["interpretation"] = [{"coding": [{"system": OBS_INTERP, "code": m[2]}]}]
            else:
                o["valueString"] = "FK 3413=" + u.get("3413")
            self.add_notes(o, [x for x in (u.get("3415"), u.get("3417")) if x])
            self.add(base + "-aks", o)
            self.obs_refs.append(base + "-aks")
            self.obs_rows.append(("Antikoerpersuchtest", m[1] if m else u.get("3413"), "", "", ""))
        # Direkter Coombstest 3418: 0 = negativ, 1 = positiv (E055)
        if u.get("3418") is not None:
            o = self.obs_base(base + "-dct", {"coding": [loinc_coding("1007-4")], "text": "Direkter Coombstest"}, "bank", eff, issued, status, spec, ident_value=idv and idv + "-DCT")
            m = {"0": ("260415000", "Not detected", "NEG"), "1": ("260373001", "Detected", "POS")}.get(u.get("3418"))
            if m:
                o["valueCodeableConcept"] = {"coding": [{"system": SCT, "code": m[0], "display": m[1]}]}
                o["interpretation"] = [{"coding": [{"system": OBS_INTERP, "code": m[2]}]}]
            else:
                o["valueString"] = "FK 3418=" + u.get("3418")
            self.add(base + "-dct", o)
            self.obs_refs.append(base + "-dct")
            self.obs_rows.append(("Direkter Coombstest", m[1] if m else u.get("3418"), "", "", ""))
        # Kreuzproben 3419
        kp = u.all("3419")
        if kp:
            o = self.obs_base(base + "-kp", {"coding": [loinc_coding("1250-0")], "text": "Kreuzproben"}, "bank", eff, issued, status, spec, ident_value=idv and idv + "-KP")
            o["valueString"] = "; ".join(kp)
            n = []
            if u.get("3420") is not None:
                n.append("Nachweis Hauptantigene/NHP: " + ("kein Nachweis" if u.get("3420") == "0" else u.get("3420")))
            n += ["Praeparatekennung: " + x for x in u.all("7275")]
            self.add_notes(o, n)
            self.add(base + "-kp", o)
            self.obs_refs.append(base + "-kp")
            self.obs_rows.append(("Kreuzproben", "; ".join(kp), "", "", ""))

    def build_results(self):
        idx = 0
        for bericht in self.satz_8205.children("Obj_0035"):
            for f, v, u in bericht.fields:
                if u is None:
                    continue
                idx += 1
                if u.name == "Obj_0060":
                    self.build_klinische_chemie(u, idx)
                elif u.name == "Obj_0061":
                    self.build_mikrobiologie(u, idx)
                elif u.name in ("Obj_0062", "Obj_0063", "Obj_0073"):
                    self.build_textbefund(u, idx, u.name)
                elif u.name == "Obj_0055":
                    self.build_blutgruppe(u, idx)
                elif u.name == "Obj_0056":
                    self.tumor_texts.append(tumor_text(u))
                    list(self.collect_hinweise(u, "Tumor"))
                elif u.name == "Obj_0068":
                    self.bericht_texts.extend(u.all("3564"))
                elif u.name == "Obj_0026":
                    list(self.collect_hinweise(bericht, "Laborergebnisbericht"))
                elif u.name == "Obj_0010":
                    self.build_attachment(u, f"anh-bericht-{idx}")

    # --- Weitere Objekte ------------------------------------------------------
    def build_attachment(self, a, key):
        content_type = {"PDF": "application/pdf", "PNG": "image/png", "JPG": "image/jpeg", "JPEG": "image/jpeg",
                        "TXT": "text/plain", "XML": "application/xml"}.get((a.get("6303") or "").upper(), "application/octet-stream")
        att = {"contentType": content_type}
        if a.get("6305"):
            att["title"] = a.get("6305")
        b64 = a.child("Obj_0068", "8242")
        if b64 is not None:
            att["data"] = "".join(b64.all("6329"))
        elif a.get("9908"):
            att["title"] = att.get("title") or a.get("9908")
        d = {"resourceType": "DocumentReference", "status": "current", "subject": self.ref("patient"),
             "date": self.befund_instant, "content": [{"attachment": att}]}
        if a.get("6327"):
            d["description"] = a.get("6327")
        ids = [{"system": self.lab_ns + "/sid/dokument-id", "value": v} for v in a.all("9980")]
        if ids:
            d["identifier"] = ids
        self.add(key, d)
        self.attachment_keys.append((key, att.get("title", key), a.get("6327", "")))

    def build_pregnancy(self, pat):
        sw = next(iter(self.satz_8205.walk("Obj_0050")), None)
        if sw is None:
            return
        et = sw.get("3471")
        if et:
            e = {"resourceType": "Observation", "meta": {"profile": [PROFILE + "ISiKSchwangerschaftErwarteterEntbindungstermin"]},
                 "status": "final", "code": {"coding": [loinc_coding("11779-6")]},
                 "subject": self.ref("patient"), "encounter": self.ref("encounter"),
                 "effectiveDateTime": self.befund_dt[:10], "valueDateTime": ymd(et),
                 "performer": [self.ref("prac-sender", self.sender_name)]}
            self.add("preg-et", e)
        s = {"resourceType": "Observation", "meta": {"profile": [PROFILE + "ISiKSchwangerschaftsstatus"]},
             "status": "final", "code": {"coding": [loinc_coding("82810-3")]},
             "subject": self.ref("patient"), "encounter": self.ref("encounter"),
             "effectiveDateTime": self.befund_dt[:10],
             "performer": [self.ref("prac-sender", self.sender_name)],
             "valueCodeableConcept": {"coding": [{"system": LOINC, "code": "LA15173-0", "display": "Pregnant"}]}}
        notes = []
        if sw.get("8511"):
            notes.append("Schwangerschaftsdauer in Tagen: " + sw.get("8511"))
        if sw.get("8512"):
            notes.append("Erster Tag der letzten Periode: " + ymd(sw.get("8512")))
        if notes:
            s["note"] = [{"text": t} for t in notes]
        if et:
            s["hasMember"] = [self.ref("preg-et")]
        self.add("preg-status", s)
        self.extra_keys.append(("preg-status", "Schwangerschaftsstatus: schwanger" + (f", ET {ymd(et)}" if et else "")))
        if et:
            self.extra_keys.append(("preg-et", ""))

    def build_body(self, pat):
        kk = next(iter(self.satz_8205.walk("Obj_0069")), None)
        if kk is None:
            return
        # Obj_0069: 3622 Groesse, 3623 Gewicht; Einheiten/Timestamps folgen jeweils
        seq = kk.fields
        for i, (f, v, c) in enumerate(seq):
            if f not in ("3622", "3623"):
                continue
            unit, ts = None, None
            for f2, v2, c2 in seq[i + 1:]:
                if f2 in ("3622", "3623"):
                    break
                if f2 == "8421":
                    unit = v2
                if f2 == "8225" and c2 is not None:
                    ts = c2
            code = "8302-2" if f == "3622" else "29463-7"
            cmp_, num = parse_number(v)
            if num is None:
                continue
            o = {"resourceType": "Observation", "meta": {"profile": ["http://hl7.org/fhir/StructureDefinition/vitalsigns"]},
                 "status": "final",
                 "category": [{"coding": [{"system": OBS_CAT, "code": "vital-signs", "display": "Vital Signs"}]}],
                 "code": {"coding": [loinc_coding(code)], "text": "Koerpergroesse" if f == "3622" else "Koerpergewicht"},
                 "subject": self.ref("patient"), "encounter": self.ref("encounter"),
                 "effectiveDateTime": ts_to_fhir(ts) or self.befund_dt,
                 "performer": [self.ref("prac-sender", self.sender_name)],
                 "valueQuantity": quantity(num, unit or ("cm" if f == "3622" else "kg"))}
            key = "body-" + f
            self.add(key, o)
            self.extra_keys.append((key, f"{o['code']['text']}: {v} {unit or ''}"))

    def build_medication(self):
        seen = set()
        for i, med in enumerate(self.satz_8205.walk("Obj_0070")):
            sig = (med.get("6208"), med.get("6206"), med.get("6207"))
            if sig in seen:
                continue
            seen.add(sig)
            key = f"med-{i}"
            codings = []
            if med.get("6206"):
                codings.append({"system": PZN, "code": med.get("6206")})
            for w in med.children("Obj_0071"):
                if w.get("6224") and (w.get("6214") or "").upper() == "ATC":
                    codings.append({"system": ATC, "code": w.get("6224")})
            mc = {"text": med.get("6208") or "Medikament"}
            if codings:
                mc["coding"] = codings
            m = {"resourceType": "MedicationStatement", "status": "active",
                 "medicationCodeableConcept": mc, "subject": self.ref("patient"),
                 "context": self.ref("encounter"), "dateAsserted": self.befund_dt[:10]}
            per = {}
            a, b = med.child("Obj_0054", "8226"), med.child("Obj_0054", "8227")
            if a:
                per["start"] = ts_to_fhir(a)
            if b:
                per["end"] = ts_to_fhir(b)
            if per:
                m["effectivePeriod"] = per
            if med.get("6207"):
                m["dosage"] = [{"text": med.get("6207")}]
            n = med.texts("8167")
            if n:
                m["note"] = [{"text": t} for t in n]
            self.add(key, m)
            self.extra_keys.append((key, "Medikation: " + mc["text"] + (" - " + med.get("6207") if med.get("6207") else "")))

    def build_service_request(self, cond_keys):
        bi = self.satz_8205.child("Obj_0017")
        ids = []
        if bi and bi.get("8310"):
            ids.append({"type": {"coding": [{"system": V2_0203, "code": "PLAC"}]}, "system": self.praxis_ns + "/sid/auftragsnummer", "value": bi.get("8310")})
        if bi and bi.get("8311"):
            ids.append({"type": {"coding": [{"system": V2_0203, "code": "FILL"}]}, "system": self.lab_ns + "/sid/auftragsnummer", "value": bi.get("8311")})
        for nf in (bi.all("8313") if bi else []):
            ids.append({"system": self.praxis_ns + "/sid/nachforderung", "value": nf})
        sr = {"resourceType": "ServiceRequest", "status": "completed", "intent": "order",
              "category": [{"coding": [{"system": SCT, "code": "108252007", "display": "Laboratory procedure"}]}],
              "code": {"coding": [loinc_coding("26436-6")], "text": "Laboruntersuchung"},
              "subject": self.ref("patient"), "encounter": self.ref("encounter"),
              "requester": self.ref("prac-sender", self.sender_name),
              "performer": [self.ref("org-lab")]}
        if ids:
            sr["identifier"] = ids
        at = ts_to_fhir(bi.child("Obj_0054", "8214")) if bi else None
        if at:
            sr["authoredOn"] = at
        if cond_keys:
            sr["reasonReference"] = [self.ref(k) for k in cond_keys]
        vg = self.satz_8205.child("Obj_0027")
        notes = vg.texts("8217") + vg.all("4209") + ([vg.get("4208")] if vg and vg.get("4208") else []) if vg else []
        if notes:
            sr["note"] = [{"text": t} for t in notes]
        self.add("servicerequest", sr)

    def build_diagnostic_report(self):
        bi = self.satz_8205.child("Obj_0017")
        status = {"2": "final", "1": "partial", "3": "final", "4": "corrected"}.get(bi.get("8401") if bi else "2", "final")
        dr = {"resourceType": "DiagnosticReport",
              "identifier": [{"type": {"coding": [{"system": V2_0203, "code": "FILL"}]}, "system": self.lab_ns + "/sid/befund-id", "value": self.befund_id}],
              "basedOn": [self.ref("servicerequest")],
              "status": status,
              "category": [{"coding": [{"system": "http://terminology.hl7.org/CodeSystem/v2-0074", "code": "LAB", "display": "Laboratory"}]}],
              "code": {"coding": [loinc_coding("11502-2")], "text": "Laborbefund"},
              "subject": self.ref("patient"), "encounter": self.ref("encounter"),
              "effectiveDateTime": self.befund_dt, "issued": self.befund_instant,
              "performer": [self.ref("org-lab"), self.ref("prac-lab", self.lab_doctor_name)],
              "resultsInterpreter": [self.ref("prac-lab", self.lab_doctor_name)]}
        if self.specimen_keys:
            dr["specimen"] = [self.ref(k) for k in self.specimen_keys.values()]
        if self.obs_refs:
            dr["result"] = [self.ref(k) for k in self.obs_refs]
        concl = (bi.texts("8247") if bi else []) + self.bericht_texts
        if concl:
            dr["conclusion"] = " ".join(concl)
        if self.attachment_keys:
            dr["presentedForm"] = []
            for k, title, desc in self.attachment_keys:
                res = next(e["resource"] for e in self.entries if e["resource"]["id"] == self.refs[k][9:])
                dr["presentedForm"].append(dict(res["content"][0]["attachment"]))
        self.add("diagnosticreport", dr)

    def build_composition(self, cond_keys):
        bi = self.satz_8205.child("Obj_0017")
        sections = []
        # 1 Ergebnisse
        rows = "".join(f"<tr><td>{esc(a)}</td><td>{esc(b)}</td><td>{esc(c)}</td><td>{esc(d)}</td><td>{esc(e)}</td></tr>" for a, b, c, d, e in self.obs_rows)
        tbl = f"<table><thead><tr><th>Untersuchung</th><th>Ergebnis</th><th>Einheit</th><th>Bewertung</th><th>Referenzbereich</th></tr></thead><tbody>{rows}</tbody></table>"
        concl = (bi.texts("8247") if bi else []) + self.bericht_texts
        if concl:
            tbl += "<p><b>Beurteilung:</b> " + esc(" ".join(concl)) + "</p>"
        sections.append({"title": "Laborergebnisse",
                         "code": {"coding": [loinc_coding("26436-6")]},
                         "text": {"status": "generated", "div": xhtml(tbl)},
                         "entry": [self.ref("diagnosticreport")] + [self.ref(k) for k in self.obs_refs]})
        # 2 Diagnosen
        if cond_keys:
            items = []
            for k in cond_keys:
                res = next(e["resource"] for e in self.entries if e["resource"]["id"] == self.refs[k][9:])
                code = res["code"].get("coding", [{}])[0].get("code", "")
                items.append(f"<li>{esc(code)} {esc(res['code'].get('text', ''))}</li>")
            sections.append({"title": "Diagnosen / Veranlassungsgrund",
                             "text": {"status": "generated", "div": xhtml("<ul>" + "".join(items) + "</ul>")},
                             "entry": [self.ref(k) for k in cond_keys]})
        # 3 Material
        if self.specimen_keys:
            items = []
            for ident, k in self.specimen_keys.items():
                res = next(e["resource"] for e in self.entries if e["resource"]["id"] == self.refs[k][9:])
                items.append(f"<li>{esc(ident)}: {esc(res['type'].get('text', ''))} ({esc(res.get('collection', {}).get('collectedDateTime', ''))})</li>")
            sections.append({"title": "Probenmaterial",
                             "text": {"status": "generated", "div": xhtml("<ul>" + "".join(items) + "</ul>")},
                             "entry": [self.ref("servicerequest")] + [self.ref(k) for k in self.specimen_keys.values()]})
        # 4 Hinweise
        hin = list(dict.fromkeys(self.hinweise + self.tumor_texts + (bi.texts("8167") if bi else [])))
        if hin:
            sections.append({"title": "Hinweise",
                             "text": {"status": "generated", "div": xhtml("<ul>" + "".join(f"<li>{esc(h)}</li>" for h in hin) + "</ul>")}})
        # 5 Weitere Angaben (Schwangerschaft, Koerpermasse, Medikation)
        if self.extra_keys:
            items = [f"<li>{esc(t)}</li>" for k, t in self.extra_keys if t]
            sections.append({"title": "Weitere Angaben",
                             "text": {"status": "generated", "div": xhtml("<ul>" + "".join(items) + "</ul>")},
                             "entry": [self.ref(k) for k, t in self.extra_keys]})
        # 6 Anhaenge
        if self.attachment_keys:
            items = [f"<li>{esc(t)}{' - ' + esc(d) if d else ''}</li>" for k, t, d in self.attachment_keys]
            sections.append({"title": "Anhaenge",
                             "text": {"status": "generated", "div": xhtml("<ul>" + "".join(items) + "</ul>")},
                             "entry": [self.ref(k) for k, t, d in self.attachment_keys]})
        title = f"Laborbefund {self.befund_id} vom {self.befund_dt[:10]}"
        summary = (f"<p><b>{esc(title)}</b></p><p>Patient: {esc(self.patient_display)}; Einsender: {esc(self.sender_name)}; "
                   f"Labor: {esc(self.lab_doctor_name)}</p>")
        comp = {"resourceType": "Composition", "meta": {"profile": [PROFILE + "ISiKBerichtSubSysteme"]},
                "text": {"status": "extensions", "div": xhtml(summary)},
                "identifier": {"type": {"coding": [{"system": V2_0203, "code": "FILL"}]}, "system": self.lab_ns + "/sid/befund-id", "value": self.befund_id},
                "status": "final",
                "type": {"coding": [{"system": KDL, "code": "LB120107", "display": "Laborbefund"},
                                    {"system": XDS_TYPE, "code": "BEFU", "display": "Ergebnisse Diagnostik"},
                                    loinc_coding("11502-2")],
                         "text": "Laborbefund"},
                "category": [{"coding": [{"system": XDS_CLASS, "code": "LAB", "display": "Laborergebnisse"}]}],
                "subject": self.ref("patient"), "encounter": self.ref("encounter"),
                "date": self.befund_dt,
                "author": [self.ref("prac-lab", self.lab_doctor_name), self.ref("org-lab")],
                "title": title,
                "custodian": self.ref("org-lab"),
                "section": sections}
        comp["author"][1]["display"] = next(e["resource"]["name"] for e in self.entries if e["resource"]["id"] == self.refs["org-lab"][9:])
        return comp

    # --- Ablauf ------------------------------------------------------------
    def convert(self):
        bi = self.satz_8205.child("Obj_0017")
        self.befund_id = (bi.get("7305") if bi else None) or (bi.get("8311") if bi else None) or self.stem
        ts = bi.child("Obj_0054", "8216") if bi else None
        self.befund_dt = ts_to_fhir(ts) or ts_to_fhir(self.satz_8220.child("Obj_0032").child("Obj_0054", "8218")) or date.today().isoformat()
        self.befund_instant = ts_to_fhir(ts, want_instant=True) or (self.befund_dt if "T" in self.befund_dt else self.befund_dt + "T00:00:00+01:00")
        self.tumor_texts, self.bericht_texts, self.attachment_keys, self.extra_keys = [], [], [], []

        self.build_lab()
        self.build_sender()
        pat = self.build_patient()
        first_collect = self.build_specimens_prescan()
        self.build_encounter(first_collect)
        cond_keys = self.build_conditions(self.befund_dt[:10])
        self.build_specimens()
        self.build_service_request(cond_keys)
        self.build_results()
        # Anhaenge in Befundinformationen / Veranlassungsgrund / Namenskennung
        if bi:
            for i, a in enumerate(bi.walk("Obj_0010")):
                self.build_attachment(a, f"anh-bi-{i}")
            for fm in bi.children("Obj_0026"):
                list(self.collect_hinweise(bi, "Befund"))
                break
        vg = self.satz_8205.child("Obj_0027")
        if vg:
            for i, a in enumerate(vg.walk("Obj_0010")):
                self.build_attachment(a, f"anh-vg-{i}")
        self.build_pregnancy(pat)
        self.build_body(pat)
        self.build_medication()
        self.build_diagnostic_report()
        comp = self.build_composition(cond_keys)
        self.add("composition", comp)
        # Composition muss erster Eintrag sein
        self.entries.insert(0, self.entries.pop())
        bundle = {"resourceType": "Bundle", "id": self.uid("bundle"),
                  "meta": {"profile": [PROFILE + "ISiKBerichtBundle"]},
                  "identifier": {"type": {"coding": [{"system": V2_0203, "code": "FILL"}]},
                                 "system": self.lab_ns + "/sid/befund-bundle", "value": self.befund_id},
                  "type": "document", "timestamp": self.befund_instant,
                  "entry": self.entries}
        return bundle

    def build_specimens_prescan(self):
        first = None
        for m in self.satz_8205.children("Obj_0037"):
            ct = ts_to_fhir(m.child("Obj_0054", "8219"))
            if ct:
                d = ct[:10]
                first = d if first is None or d < first else first
        return first


def is_befund(path):
    try:
        raw = open(path, "rb").read(200).decode(ENCODING, "replace")
    except OSError:
        return False
    return "80008220" in raw or "\r\n01380008205" in open(path, "rb").read().decode(ENCODING, "replace")


def main(argv):
    out_dir = "isik-fhir"
    files = []
    renames = []
    i = 0
    while i < len(argv):
        if argv[i] == "--out":
            out_dir = argv[i + 1]
            i += 2
        elif argv[i] == "--rename":
            old, new = argv[i + 1].split("=", 1)
            renames.append((old, new))
            i += 2
        else:
            files.append(argv[i])
            i += 1
    if not files:
        files = [f for f in sorted(glob.glob("*.ldt")) if is_befund(f)]
    os.makedirs(out_dir, exist_ok=True)
    prescan(files)
    for f in files:
        conv = Converter(f)
        bundle = conv.convert()
        name = conv.stem
        for old, new in renames:
            if name.startswith(old):
                name = new + name[len(old):]
                break
        out = os.path.join(out_dir, name + ".bundle.json")
        with open(out, "w", encoding="utf-8") as fh:
            json.dump(bundle, fh, ensure_ascii=False, indent=2)
            fh.write("\n")
        n = len(bundle["entry"])
        nobs = sum(1 for e in bundle["entry"] if e["resource"]["resourceType"] == "Observation")
        print(f"{f} -> {out}  ({n} Ressourcen, {nobs} Observations)")
    write_codesystems(out_dir)


if __name__ == "__main__":
    main(sys.argv[1:])
