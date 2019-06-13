Systemd Unit for harbor:
  file.managed:
    - name: /etc/systemd/system/harbor.service
    - source: salt://harbor/harbor.service.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    #- default:
    #  VERSION: v1.7.5

harbor systemctl daemon-reload:
  cmd.run:
    - name: systemctl daemon-reload
    - require:
      - file: "Systemd Unit for harbor"

/opt/harbor/harbor.cfg:
  file.managed:
    - name: /opt/harbor/harbor.cfg
    - source: salt://harbor/harbor.cfg.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - defaults:
      #HOSTNAME: xt_docker_harbor_01.nbnbnb.org
      HOSTNAME: 192.168.56.235
      # use https need crt file ; need file.managed 2files!
      UI_URL_PROTOCOL: http
      SSL_CERT: /data/cert/server.crt
      SSL_CERT_KEY: /data/cert/server.key
      SECRETKEY_PATH: /data
      HARBOR_ADMIN_PASSWORD: harbor.nbnbnb
      # postgresql
      DB_PASSWORD: harbor.pgsql
 
#/data:
#  file.directory:
#    - user: root
#    - group: root
#    - dir_mode: 755
#    - file_mode: 644
#    - recurse:
#      - user
#      - group
#      - mode
