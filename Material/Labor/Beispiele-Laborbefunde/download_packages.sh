#!/usr/bin/env bash
# Laedt die ISiK-Stufe-6-FHIR-Pakete (Basismodul + Labor) vom IG-Build der gematik
# nach ./packages. Quelle: https://gematik.github.io/spec-ISiK-Basismodul/main-stufe-6/
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
PKG="$DIR/packages"
BASE="https://gematik.github.io/spec-ISiK-Basismodul/main-stufe-6"
mkdir -p "$PKG"
echo "Lade ISiK Basismodul (Stufe 6) ..."
curl -fsSL "$BASE/ISiK-Basis/package.tgz" -o "$PKG/de.gematik.isik-basis-6.0.0.tgz"
echo "Lade ISiK Labor (Stufe 6) ..."
curl -fsSL "$BASE/ISiK-Labor/package.tgz" -o "$PKG/de.gematik.isik-labor-6.0.0.tgz"
for f in "$PKG"/*.tgz; do
  printf '%s: ' "$(basename "$f")"
  tar -xzOf "$f" package/package.json | python3 -c 'import json,sys; p=json.load(sys.stdin); print(p["name"], p["version"], p["canonical"], "(" + p["date"] + ")")'
done
