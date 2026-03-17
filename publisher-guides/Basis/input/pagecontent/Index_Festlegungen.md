---
topic: markdown-UebergreifendeFestlegungen-UebergreifendeFestlegungen
---

In diesem Kapitel werden übergreifende Festlegungen definiert, die im Allgemeinen für die weitere Spezifikation (andere Implementierungsleitfäden) gelten.

<ul>
{% assign parent_label = site.data.pages['Index_Festlegungen.html'].label | remove: '.0' | append: '.' %}
{% for p in site.data.pages %}
  {% assign url = p[0] %}
  {% assign data = p[1] %}
  {% if data.label contains parent_label %}
  <li><a href="{{ url }}">{{ data.title }}</a></li>
  {% endif %}
{% endfor %}
</ul>