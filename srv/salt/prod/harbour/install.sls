docker-compose install:
  file.managed:
    - name: /usr/local/bin/docker-compose
    # wget https://mirrors.aliyun.com/docker-toolbox/linux/compose/1.21.2/docker-compose-Linux-x86_64
    - source: salt://harbour/docker-compose-Linux-x86_64
    - user: root
    - group: root
    - mode: 111

Systemd Unit for harbour:
  file.managed:
    - name: /etc/systemd/system/harbour.service
    - source: salt://harbour/harbour.service.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644



include:
  - dir.sls

soft install:
  pkg.installed:
    - names:
      - soft
    - require:
      - mod: ID
