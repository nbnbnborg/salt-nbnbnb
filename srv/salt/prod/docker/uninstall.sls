include:
  - docker.stop

docker-ce uninstall:
  pkg.removed:
    - names:
      - docker-ce
      - audit-libs-python
      - checkpolicy
      - container-selinux
      - containerd.io
      - docker-ce-cli
      - libcgroup
      - libseccomp
      - libsemanage-python
      #- policycoreutils(update)
      - policycoreutils-python
      - python-IPy
      - setools-libs
    - require:
      - service: "docker stop"

un docker network net.ipv4.ip_forward:
  sysctl.present:
    - name: net.ipv4.ip_forward
    - value: 0
