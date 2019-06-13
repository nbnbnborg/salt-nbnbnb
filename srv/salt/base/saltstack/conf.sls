/etc/salt/minion:
  file.managed:
    - name: /etc/salt/minion
    - source: salt://salt/salt-minion.template
    - user: root
    - group: root
    - mode: 644
    - default:
      SALTSTACK_MASTER: {{ pillar['saltstack']['SALTSTACK_MASTER'] }}

/etc/salt/minion.d:
  file.directory:
    - name: /etc/salt/minion.d
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
