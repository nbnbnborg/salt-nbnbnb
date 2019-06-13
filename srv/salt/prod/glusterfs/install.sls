centos-release-gluster install:
  pkg.installed:
    # Long Term Stable release :centos-release-gluster41
    - name: centos-release-gluster41
    #- require:EPEL repo
    - unless: test ${rpm -q centos-release-gluster41} == 0

glusterfs-server install:
  pkg.installed:
    - name: glusterfs-server
    - fromrepo: "centos-gluster41"
    - require:
      - pkg: "centos-release-gluster install"
