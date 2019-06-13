gitlab-ce repo:
  file.managed:
    - name: /etc/yum.repos.d/gitlab-ce.repo
    - source: salt://gitlab/gitlab-ce.repo.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      GPGCHECK: 0

