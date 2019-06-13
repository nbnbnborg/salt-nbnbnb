centos-release-gluster install:
  pkg.installed:
    # Long Term Stable release :centos-release-gluster41
    - name: centos-release-gluster6
    #- require:EPEL repo

glusterfs-server install:
  pkg.installed:
    - name: glusterfs-server
#    - version: 4.1.8-1.el7
    - require:
      - pkg: "centos-release-gluster install"

