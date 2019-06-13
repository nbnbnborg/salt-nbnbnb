elrepo repo:
  file.managed:
    - name: /etc/yum.repos.d/elrepo.repo
    - source: salt://docker/elrepo.repo.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      GPGCHECK: 0

# update kernel to 5.*
kernel-ml install:
  pkg.installed:
    - names: 
      - kernel-ml
      - kernel-ml-devel
      - kernel-ml-headers
    - fromrepo: elrepo-kernel
    - require:
      - file: "elrepo repo"

set default kernel grub2:
  cmd.run:
    - name: "grub2-set-default 0 && grub2-mkconfig -o /boot/grub2/grub.cfg"
    - require:
      - pkg: "kernel-ml install"
    - unless: test `uname -r|awk -F. '{ print $1 }'` != 3 
