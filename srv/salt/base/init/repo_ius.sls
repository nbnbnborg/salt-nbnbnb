ius repo:
  file.managed:
    - name: /etc/yum.repos.d/ius.repo
    - source: salt://init/files/ius.repo.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      GPGCHECK: 0
