include:
  - docker.repo

docker-ce install:
  pkg.installed:
    - names:
      - docker-ce
    - require:
      - file: "docker-ce repo"

docker network net.ipv4.ip_forward:
  sysctl.present:
    - name: net.ipv4.ip_forward
    - value: 1
