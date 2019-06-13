Systemd Unit for docker:
  file.managed:
    - name: /usr/lib/systemd/system/docker.service
    - source: salt://docker/docker.service.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      # or use /etc/docker/daemon.json
      REGISTRY_MIRROR: http://f1361db2.m.daocloud.io
      #REGISTRY_MIRROR: https://registry.docker-cn.com
      # other:
      # ExecStart=/usr/bin/dockerd -H tcp://192.168.56.11 -H unix:///var/run/docker.sock
      # or -H tcp://0.0.0.0:2375

docker systemctl daemon-reload:
  cmd.run:
    - name: systemctl daemon-reload
    - require:
      - file: "Systemd Unit for docker"

