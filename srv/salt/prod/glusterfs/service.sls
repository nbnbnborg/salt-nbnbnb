include:
  - glusterfs.install

glusterd service:
  service.running:
    - name: glusterd
    - enable: True
    - reload: True
    - require:
      - pkg: "glusterfs-server install"
