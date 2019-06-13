#/etc/ansible/ansible.cfg:
#  file.managed:
#    - name: /etc/ansible/ansible.cfg
#    - source: salt://ansible/ansible.cfg.template
#    - user: root
#    - group: root
#    - mode: 644

/etc/ansible/hosts:
  file.managed:
    - name: /etc/ansible/hosts
    - source: salt://ansible/hosts.template
    - user: root
    - group: root
    - mode: 644

#/etc/soft.d:
#  file.directory:
#    - user: root
#    - group: root
#    - dir_mode: 755
#    - file_mode: 644
#    - recurse:
#      - user
#      - group
#      - mode
