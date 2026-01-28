### Gerendertes Formular

Zur korrekten Darstellung dieses Beispiels wird eine externe Anfrage in Richtung des offiziellen HL7 Deutschland e.V. FHIR-Server (https://fhir.hl7.de/fhir) gestellt. Falls dort kein passender Patient mehr liegen sollte, scheitert die Prepopulation. Wenden Sie sich in diesem Fall bitte an das ISiK Team. 

<iframe id="formularIframe" style="width:100%; height:300px; border:none; display:block;"></iframe>
<script>
  (function() {
    var currentUrl = window.location.href.replace('.html', '.json');
    var iframeSrc = 'https://gematik.github.io/poc-isik-formular/?q=' + encodeURIComponent(currentUrl) + '&minimal=true&prepopBase=https://fhir.hl7.de/fhir&patient=10';
    document.getElementById('formularIframe').src = iframeSrc;
  })();
</script>