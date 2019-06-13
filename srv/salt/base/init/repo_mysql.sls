#/etc/yum.repos.d/mysql56-community.repo:
#  file.managed:
#    - source: salt://init/files/mysql56-community.repo
#    - user: root
#    - group: root
#    - mode: 644

mysql57-community repo:
  file.managed:
    - name: /etc/yum.repos.d/mysql57-community.repo
    - source: salt://init/files/mysql57-community.repo.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      GPGCHECK: 0

/etc/yum.repos.d/mysql-connectors-community.repo:
  file.managed:
    - source: salt://init/files/mysql-connectors-community.repo
    - user: root
    - group: root
    - mode: 644

/etc/yum.repos.d/mysql-tools-community.repo:
  file.managed:
    - source: salt://init/files/mysql-tools-community.repo
    - user: root
    - group: root
    - mode: 644
