glusterfs-server uninstall:
  pkg.removed:
    - names:
      - glusterfs-server
    - unless: test ${rpm -q glusterfs-server} == 1

# uninstall server will not uninstall client,if will need to call
glusterfs uninstall:
  pkg.removed:
    - names:
      - glusterfs
      - glusterfs-cli
      - glusterfs-client-xlators
      - glusterfs-libs
      - glusterfs-fuse
    # rpm -qa |grep gluster
    - unless: test ${rpm -q glusterfs} == 1

centos-release-gluster41 uninstall:
  pkg.removed:
    - name: centos-release-gluster41
    - unless: test ${rpm -q centos-release-gluster41} == 1

# when install release version error to use
centos-release-gluster6 uninstall:
  pkg.removed:
    - name: centos-release-gluster6
    - unless: test ${rpm -q centos-release-gluster6} == 1
