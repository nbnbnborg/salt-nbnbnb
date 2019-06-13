/etc/salt/master:
  file.managed:
    - source: salt://saltstack/salt-master.template
    - user: root
    - group: root
    - mode: 644
      
/etc/salt/master.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode

# not adaptation for 192.168.56.227 only mysql:192.168.56.11
/etc/salt/master.d/job_mysql.conf:
  file.managed:
    - source: salt://saltstack/job_mysql.conf.template
    - user: root
    - group: root
    - mode: 644
