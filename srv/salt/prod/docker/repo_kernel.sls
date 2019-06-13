kernel repo:
  file.managed:
    - name: /etc/yum.repos.d/elrepo.repo
    - source: salt://init/files/elrepo.repo.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - unless: test ${test -f /etc/yum.repos.d/elrepo.repo} = 0
    - default:
      GPGCHECK: 0
