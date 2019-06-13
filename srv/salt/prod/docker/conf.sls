Systemd Unit for docker:
  file.managed:
    - name: /usr/lib/systemd/system/docker.service
    - source: salt://docker/docker.service.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - defaults:
      # or use /etc/docker/daemon.json
      REGISTRY_MIRROR: http://f1361db2.m.daocloud.io
      #REGISTRY_MIRROR: https://registry.docker-cn.com
      # other:
      # ExecStart=/usr/bin/dockerd -H tcp://192.168.56.11 -H unix:///var/run/docker.sock
      # or -H tcp://0.0.0.0:2375
      # harbor mirror : only http use? example: domain.com or IP:PORT ,sug use https mirror.
      # ps -ef|grep docker check !
      INSECURE_REGISTRIES: xt-docker-harbor-01.nbnbnb.org
      #INSECURE_REGISTRIES: 192.168.56.235:80

# Host trust
#/etc/pki/ca-trust/source/anchors/ca.crt:
/etc/docker/certs.d/xt-docker-harbor-01.nbnbnb.org/ca.crt:
  file.managed:
    - source: salt://harbor/ca.crt
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

docker systemctl daemon-reload:
  cmd.run:
    - name: systemctl daemon-reload
    - require:
      - file: "Systemd Unit for docker"


