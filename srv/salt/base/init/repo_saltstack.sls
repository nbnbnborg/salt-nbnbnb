saltstack repo:
  file.managed:
    - name: /etc/yum.repos.d/saltstack.repo
    - source: salt://init/files/saltstack.repo.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - defaults:
      SALTSTACK_VERSION: saltstack-2019.2
      GPGCHECK: 0
