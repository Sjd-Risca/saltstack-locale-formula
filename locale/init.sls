#!jinja|yaml

{% set datamap = pillar.get('locale', False) %}

{% if datamap %}
  {% for locale in datamap %}
{{ locale.name }}:
  locale.present
{% if 'system' in locale and locale.system %}
{{ locale.name }}-system:
  locale.system:
    - name: {{ locale.name }}
{% endif %}
  {% endfor %}
{% endif %}
