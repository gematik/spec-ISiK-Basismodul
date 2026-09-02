// Release notes rendering logic
//
// NOTE: Do not pass custom `rawTemplates` to Diff2HtmlUI. Custom raw templates are
// compiled at runtime via Hogan (`new Function(...)`), which violates the Content
// Security Policy (`script-src` without `'unsafe-eval'`) on the publishing server.
// The diff2html default templates are pre-compiled into the bundle and require no
// runtime compilation. The previous cosmetic customizations (hidden file header,
// no bottom margin, wrapped dimgray content lines) are applied via CSS instead
// (see `ig.req.gematik.css`).

document.addEventListener("DOMContentLoaded", function() {
    // Initialize all diff renderers
    var diffElements = document.querySelectorAll('[id^="diff-ui-"]');
    diffElements.forEach(function(element) {
        var diffId = element.id.replace('diff-ui-', '');
        var dataElement = document.getElementById("diff-data-" + diffId);

        if (dataElement) {
            var diffData = dataElement.textContent.trim();

            if (diffData) {
                var configuration = {
                    drawFileList: false,
                    matching: 'words',
                    outputFormat: 'side-by-side',
                    renderNothingWhenEmpty: false
                };
                var diff2htmlUi = new Diff2HtmlUI(element, diffData, configuration);
                diff2htmlUi.draw();
            }
        }
    });

    // Initialize all toggle buttons
    var releaseTables = document.querySelectorAll('table[id^="release-table-"]');
    releaseTables.forEach(function(table) {
        var releaseId = table.id.replace('release-table-', '');
        var toggleAllBtn = document.getElementById("btn-toggle-all-" + releaseId);
        var toggleAllRow = document.getElementById("row-toggle-all-" + releaseId);
        var tableContainer = table;

        if (toggleAllBtn && tableContainer && toggleAllRow) {
            var diffAreas = tableContainer.querySelectorAll('.diff-collapse-area');

            if (diffAreas.length > 0) {
                toggleAllRow.style.display = 'table-row';

                toggleAllBtn.addEventListener("click", function() {
                    var anyOpen = Array.from(diffAreas).some(function(el) {
                        var isAriaExpanded = el.getAttribute('aria-expanded') === 'true';
                        var hasShowClass = el.classList.contains('show') || el.classList.contains('in');
                        var isNotZeroHeight = el.style.height !== '' && el.style.height !== '0px';

                        return isAriaExpanded || hasShowClass || isNotZeroHeight;
                    });

                    diffAreas.forEach(function(diffArea) {
                        if (typeof window.jQuery !== 'undefined' && typeof window.jQuery.fn.collapse !== 'undefined') {
                            window.jQuery(diffArea).collapse(anyOpen ? 'hide' : 'show');
                        }
                        else if (typeof bootstrap !== 'undefined' && bootstrap.Collapse) {
                            var bsCollapse = bootstrap.Collapse.getInstance(diffArea);
                            if (!bsCollapse) {
                                bsCollapse = new bootstrap.Collapse(diffArea, { toggle: false });
                            }
                            anyOpen ? bsCollapse.hide() : bsCollapse.show();
                        }
                        else {
                            if (anyOpen) {
                                diffArea.style.height = '0px';
                                diffArea.setAttribute('aria-expanded', 'false');
                                diffArea.classList.remove('show', 'in');
                            } else {
                                diffArea.style.height = 'auto';
                                diffArea.setAttribute('aria-expanded', 'true');
                                diffArea.classList.add('show', 'in');
                            }
                        }
                    });
                });
            }
        }
    });
});
