include:
  - saltstack.install
  - saltstack.conf

salt-master service:
  service.running:
    - name: salt-master
    - enable: True
    - reload: True
    - require:
      - file: /etc/salt/master
      - file: "/etc/salt/master.d"
    - watch:
      - file: /etc/salt/master
      - file: "/etc/salt/master.d"
