/etc/keepalived/keepalived.conf:
  file.managed:
    - name: /etc/keepalived/keepalived.conf
    - source: salt://keepalived/keepalived.conf.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - defaults:
      EMAIL_SEND: admin@nbnbnb.org
      EMAIL_FROM: XXX@qq.com
      SMTP_SERVER: smtp.qq.com
      ROUTER_ID: {{ pillar['keepalived']['ROUTER_ID'] }}
      VRRP_INSTANCE: {{ pillar['keepalived']['VRRP_INSTANCE'] }}
      STATE: {{ pillar['keepalived']['STATE'] }}
      VIRTUAL_ROUTER_ID: {{ pillar['keepalived']['VIRTUAL_ROUTER_ID'] }}
      PRIORITY: {{ pillar['keepalived']['PRIORITY'] }}
      VIP: {{ pillar['keepalived']['VIP'] }}

/etc/keepalived:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
