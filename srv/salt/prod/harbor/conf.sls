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
      HOSTNAME: xt-docker-harbor-01.nbnbnb.org
      #HOSTNAME: 192.168.56.235
      # use https need crt file ; need file.managed 2files!
      UI_URL_PROTOCOL: https
      SSL_CERT: /data/cert/server.crt
      SSL_CERT_KEY: /data/cert/server.key
      SECRETKEY_PATH: /data
      HARBOR_ADMIN_PASSWORD: harbor.nbnbnb
      # postgresql
      DB_PASSWORD: harbor.pgsql
 
/data/cert:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
    - makedirs: True

/data/cert/server.crt:
  file.managed:
    - source: salt://harbor/nbnbnb.org.crt
    - user: root
    - group: root
    - mode: 600

/data/cert/server.key:
  file.managed:
    - source: salt://harbor/nbnbnb.org.key
    - user: root
    - group: root
    - mode: 600

