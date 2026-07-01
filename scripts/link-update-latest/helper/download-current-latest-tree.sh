#!/usr/bin/env bash
# update-ig-redirect.sh
# Downloads taltest files from gcp
# Prerequisites: gcloud auth login, gsutil (Google Cloud SDK), bash (Linux/macOS/WSL)

# download all latest folders including html (/isik/basis/latest + /isik/vitalparameter/latest etc.) from dev 
gsutil -m cp -r "gs://gematik_gemspec_fhir_dev-0/ig/fhir/isik/*/latest/" ./latest-download/


