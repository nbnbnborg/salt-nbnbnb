base 7 repo:
  file.managed:
    - name: /etc/yum.repos.d/base.repo
    - source: salt://init/files/base.repo.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - unless: test ${test -f /etc/yum.repos.d/CentOS-Base.repo} = 0
    - default:
      GPGCHECK: 0

# yum_base_repo_file:
#   file.append:
#     - name: /etc/yum.repos.d/base.repo
#     - makedirs: True
#     - text: |
#         [base]
#         name=CentOS-$releasever - Base
#         baseurl=http://yum.51niux.com/centos/$releasever/os/$basearch/
#         gpgcheck=0
