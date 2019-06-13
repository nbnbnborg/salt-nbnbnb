docker-compose install:
  file.managed:
    - name: /usr/local/bin/docker-compose
    # wget https://mirrors.aliyun.com/docker-toolbox/linux/compose/1.21.2/docker-compose-Linux-x86_64
    - source: salt://harbour/docker-compose-Linux-x86_64
    - user: root
    - group: root
    - mode: 755

mkdir /opt:
  file.directory:
    - name: /opt
    - user: root
    - group: root
    - dir_mode: 755

harbor offline install:
  file.managed:
    - name: /opt/harbor-offline-installer-v1.7.5.tgz
    # wget https://storage.googleapis.com/harbor-releases/release-1.7.0/harbor-offline-installer-v1.7.5.tgz
    - source: salt://harbor/harbor-offline-installer-v1.7.5.tgz
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: "mkdir /opt"
  cmd.run:
    - name: "cd /opt && tar xf harbor-offline-installer-v1.7.5.tgz"
    - require:
      - file: "harbor offline install"
    - unless: test ${test -d /opt/harbor} = 0

docker network net.ipv4.ip_forward:
  sysctl.present:
    - name: net.ipv4.ip_forward
    - value: 1
