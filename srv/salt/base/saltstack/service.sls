include:
  - saltstack.install
  - saltstack.conf

salt-minion service:
  service.running:
    - name: salt-minion
    - enable: True
    - reload: True
    - require:
      - file: /etc/salt/minion
      - file: /etc/salt/minion.d
    - watch:
      - file: /etc/salt/minion
      - file: /etc/salt/minion.d

