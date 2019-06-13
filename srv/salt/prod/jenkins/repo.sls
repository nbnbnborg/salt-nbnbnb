jenkins repo:
  file.managed:
    - name: /etc/yum.repos.d/jenkins.repo
    - source: salt://jenkins/jenkins.repo.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      GPGCHECK: 0

jenkins yum:
  cmd.run:
    - name: |
            yum clean all && \
            yum makecache
    - require:
      - file: "jenkins repo"

