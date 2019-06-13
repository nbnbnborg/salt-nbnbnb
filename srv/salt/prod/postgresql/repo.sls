postgresql repo:
  file.managed:
    - name: /etc/yum.repos.d/postgresql.repo
    - source: salt://postgresql/postgresql.repo.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      GPGCHECK: 0
