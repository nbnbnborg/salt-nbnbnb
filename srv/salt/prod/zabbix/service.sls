include:
  - soft.install
  - soft.conf

soft service:
  service.running:
    - name: soft
    - enable: True
    - reload: True
    - require:
      - file: /etc/soft.conf
    - watch:
      - file: /etc/soft.conf
