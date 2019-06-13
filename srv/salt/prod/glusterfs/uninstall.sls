centos-release-gluster6 uninstall:
  pkg.removed:
    - name: centos-release-gluster6
    - unless: test ${rpm -q centos-release-gluster6} == 1

centos-release-gluster41 uninstall:
  pkg.removed:
    - name: centos-release-gluster41
    - unless: test ${rpm -q centos-release-gluster41} == 1

glusterfs-server uninstall:
  pkg.removed:
    - name: glusterfs-server
