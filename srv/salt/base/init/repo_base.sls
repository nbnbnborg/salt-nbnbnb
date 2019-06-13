/etc/yum.repos.d/base.repo:
  file.managed:
    - source: salt://init/files/base.repo
    - user: root
    - group: root
    - mode: 644

# yum_base_repo_file:
#   file.append:
#     - name: /etc/yum.repos.d/base.repo
#     - makedirs: True
#     - text: |
#         [base]
#         name=CentOS-$releasever - Base
#         baseurl=http://yum.51niux.com/centos/$releasever/os/$basearch/
#         gpgcheck=0
