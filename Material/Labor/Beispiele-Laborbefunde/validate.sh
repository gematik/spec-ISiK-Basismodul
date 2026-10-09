#!/usr/bin/env bash
# Validiert alle ISiK-Bundles (*.bundle.json) in diesem Verzeichnis mit dem
# HL7 FHIR Validator gegen die ISiK-Stufe-6-Profile (Basismodul + Labor).
#
#   ./validate.sh              alle Bundles
#   ./validate.sh DATEI...     nur die angegebenen Bundles
#
# Voraussetzungen: java (>= 17), curl, python3, Internet (Terminologieserver
# tx.fhir.org und Paketregistry packages.fhir.org beim ersten Lauf).
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
PKG="$DIR/packages"
TOOLS="$DIR/.tools"
VALIDATOR="$TOOLS/validator_cli.jar"
VALIDATOR_VERSION="6.10.4"
VALIDATOR_URL="https://github.com/hapifhir/org.hl7.fhir.core/releases/download/${VALIDATOR_VERSION}/validator_cli.jar"
PROFILE="https://gematik.de/fhir/isik/StructureDefinition/ISiKBerichtBundle"
LOG="$DIR/validation.log"
mkdir -p "$TOOLS"

# 1. Profilpakete
if [ ! -f "$PKG/de.gematik.isik-basis-6.0.0.tgz" ] || [ ! -f "$PKG/de.gematik.isik-labor-6.0.0.tgz" ]; then
  "$DIR/download_packages.sh"
fi

# 2. Validator
if [ ! -f "$VALIDATOR" ]; then
  echo "Lade HL7 FHIR Validator ${VALIDATOR_VERSION} ..."
  curl -fsSL "$VALIDATOR_URL" -o "$VALIDATOR"
fi

# 3. Paket-Abhaengigkeit kbv.all.terminology.allergyintolerance#1.0.0 ist in keiner
#    oeffentlichen Registry verfuegbar (Stand 09/2026) und wird fuer Laborbefunde
#    nicht benoetigt. Die Pakete werden deshalb ohne diese Abhaengigkeit nach
#    .tools/ kopiert; alle anderen Abhaengigkeiten laedt der Validator selbst.
python3 - "$PKG" "$TOOLS" <<'PY'
import io, json, os, sys, tarfile
src, dst = sys.argv[1], sys.argv[2]
DROP = {"kbv.all.terminology.allergyintolerance"}
for name in sorted(os.listdir(src)):
    if not name.endswith(".tgz"):
        continue
    out = os.path.join(dst, name)
    if os.path.exists(out) and os.path.getmtime(out) >= os.path.getmtime(os.path.join(src, name)):
        continue
    with tarfile.open(os.path.join(src, name), "r:gz") as tin, tarfile.open(out, "w:gz") as tout:
        for m in tin:
            data = tin.extractfile(m) if m.isfile() else None
            if m.name == "package/package.json":
                p = json.load(data)
                p["dependencies"] = {k: v for k, v in p.get("dependencies", {}).items() if k not in DROP}
                raw = json.dumps(p, indent=2).encode()
                m.size = len(raw)
                data = io.BytesIO(raw)
            tout.addfile(m, data)
    print(f"Paket vorbereitet: {out}")
PY

# 4. Zu pruefende Dateien
if [ $# -gt 0 ]; then
  FILES=("$@")
else
  FILES=("$DIR"/*.bundle.json)
fi
echo "Validiere ${#FILES[@]} Bundle(s) gegen $PROFILE"
echo "Protokoll: $LOG"

# 5. Validierung (ein Lauf fuer alle Dateien; Pakete werden nur einmal geladen)
set +e
java -jar "$VALIDATOR" \
  -version 4.0.1 \
  -ig "$TOOLS/de.gematik.isik-basis-6.0.0.tgz" \
  -ig "$TOOLS/de.gematik.isik-labor-6.0.0.tgz" \
  -ig dvmd.kdl.r4#2025.0.1 \
  -profile "$PROFILE" \
  -ig kbv.all.st#1.8.0 \
  -ig "$DIR/terminology" \
  -locale en \
  "${FILES[@]}" > "$LOG" 2>&1
RC=$?
set -e

# 6. Zusammenfassung
python3 - "$LOG" <<'PY'
import re, sys
log = open(sys.argv[1], encoding="utf-8", errors="replace").read()
# Blockweise: "-- <datei> ---..." Kopf, dann "Success:/*FAILURE*:" Zeile
blocks = re.split(r"\n-- (\S+) -+\n", log)
total_err = 0
rows = []
for i in range(1, len(blocks), 2):
    f, body = blocks[i], blocks[i + 1]
    m = re.search(r"(Success|\*FAILURE\*): (\d+) errors?, (\d+) warnings?, (\d+) notes?", body)
    if not m:
        rows.append((f, "?", "?", "?", "unbekannt")); continue
    e, w, n = int(m.group(2)), int(m.group(3)), int(m.group(4))
    total_err += e
    rows.append((f, e, w, n, "OK" if e == 0 else "FEHLER"))
if not rows:
    m = re.search(r"(Success|\*FAILURE\*): (\d+) errors?, (\d+) warnings?, (\d+) notes?", log)
    if m:
        rows.append(("(eine Datei)", int(m.group(2)), int(m.group(3)), int(m.group(4)), "OK" if m.group(2) == "0" else "FEHLER"))
        total_err = int(m.group(2))
    else:
        print(log[-3000:]); sys.exit(2)
w = max(len(r[0].split('/')[-1]) for r in rows)
print(f"{'Datei':<{w}}  Fehler  Warn.  Hinw.  Status")
for f, e, wn, n, s in rows:
    print(f"{f.split('/')[-1]:<{w}}  {e!s:>6}  {wn!s:>5}  {n!s:>5}  {s}")
print(f"\nGesamt: {len(rows)} Bundle(s), {total_err} Fehler")
sys.exit(1 if total_err else 0)
PY
