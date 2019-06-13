include:
  - docker.install
  - docker.conf

docker-ce service:
  service.running:
    - name: docker
    - enable: True
    - reload: True
    - require:
      - cmd: "docker systemctl daemon-reload"
    # if change /usr/lib/systemd/system/docker.service run docker.conf with hand!
    - watch:
      - file: "Systemd Unit for docker"
