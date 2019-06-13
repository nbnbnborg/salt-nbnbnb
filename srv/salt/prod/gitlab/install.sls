include:
  - gitlab.repo

gitlab-ce require install:
  pkg.installed:
    - names:
      - curl
      - policycoreutils
      - policycoreutils-python
      - openssh-server
      - openssh-clients

gitlab-ce install:
  pkg.installed:
    - name: gitlab-ce
    - fromrepo: gitlab-ce
    - require:
      - file: "gitlab-ce repo"

postfix service:
  service.running:
    - name: postfix
    - enable: True
    - reload: True
    #- require:
    #  - file: /etc/soft.conf
    #- watch:
    #  - file: /etc/soft.conf

