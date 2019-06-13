include:
  - redis.install

redis-config:
  file.managed:
    - name: /etc/redis.conf
    - source: salt://redis/redis5.conf.template
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
      IPADDR: {{ grains['fqdn_ip4'][0] }}
      PORT: 6379
      MAX_MEMORY: 1GB

redis-service:
  service.running:
    - name: redis
    - enable: True
    - reload: True
    - watch:
      - file: redis-config
    - require:
      - pkg: redis5-install
