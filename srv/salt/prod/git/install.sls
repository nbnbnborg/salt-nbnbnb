#include:
#  - ius.yum-replace-install

git2u install:
  pkg.installed:
    - name: git2u
#    - require:
#      - pkg: "yum-plugin-replace install"
    - unless: "test ! -f /etc/yum.repos.d/ius.repo"

