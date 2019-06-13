include:
  - elasticsearch.install
  - elasticsearch.conf

elasticsearch service:
  service.running:
    - name: elasticsearch
    - enable: True
    - reload: True
    - require:
      - file: "/etc/elasticsearch/elasticsearch.yml"
    - watch:
      - file: "/etc/elasticsearch/elasticsearch.yml"
