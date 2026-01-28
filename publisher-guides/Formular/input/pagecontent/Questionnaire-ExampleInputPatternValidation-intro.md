### Gerendertes Formular

Das Feature wird von LHC-Forms zum aktuellen Zeitpunkt noch nicht unterstützt. Aus dem Grund wird im gerenderten Formular die Validierung noch nicht korrekt ausgeführt.

<iframe id="formularIframe" style="width:100%; height:300px; border:none; display:block;"></iframe>
<script>
  (function() {
    var currentUrl = window.location.href.replace('.html', '.json');
    var iframeSrc = 'https://gematik.github.io/poc-isik-formular/?q=' + encodeURIComponent(currentUrl) + '&minimal=true';
    document.getElementById('formularIframe').src = iframeSrc;
  })();
</script>