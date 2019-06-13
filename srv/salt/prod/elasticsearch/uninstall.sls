include:
  elasticsearch.stop

elasticsearch uninstall:
  pkg.removed:
    - name: elasticsearch
