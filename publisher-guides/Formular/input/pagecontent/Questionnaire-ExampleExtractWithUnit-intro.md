### Gerendertes Formular

Beim Klicken auf "Zeige QR + Observations" werden Sie auf eine externe Seite weitergeleitet, auf der die durch Sie in der Demo eingegebenen Werte als QuestionnaireResonse und extragierte Observations dargestellt werden.

<iframe id="formularIframe" style="width:100%; height:300px; border:none; display:block;"></iframe>
<script>
  (function() {
    var currentUrl = window.location.href.replace('.html', '.json');
    var iframeSrc = 'https://gematik.github.io/poc-isik-formular/?q=' + encodeURIComponent(currentUrl) + '&minimal=withbuttons';
    document.getElementById('formularIframe').src = iframeSrc;
  })();
</script>