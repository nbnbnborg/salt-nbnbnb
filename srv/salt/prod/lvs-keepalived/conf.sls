/etc/keepalived/keepalived.conf:
  file.managed:
    - source: salt://keepalived/keepalived.conf.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - defaults:
      EMAIL_SEND: admin@nbnbnb.org
      EMAIL_FROM: XXX@qq.com
      SMTP_SERVER: smtp.qq.com
      ROUTER_ID: {{ pillar['lvs-keepalived']['ROUTER_ID'] }}
      VRRP_INSTANCE: {{ pillar['lvs-keepalived']['VRRP_INSTANCE'] }}
      STATE: {{ pillar['lvs-keepalived']['STATE'] }}
      VIRTUAL_ROUTER_ID: {{ pillar['lvs-keepalived']['VIRTUAL_ROUTER_ID'] }}
      PRIORITY: {{ pillar['lvs-keepalived']['PRIORITY'] }}
      VIP: {{ pillar['lvs-keepalived']['VIP'] }}


      VIRTUAL_SERVER_IP: {{ pillar['lvs-keepalived']['VIRTUAL_SERVER_IP'] }}
      VIRTUAL_SERVER_PORT: {{ pillar['lvs-keepalived']['VIRTUAL_SERVER_PORT'] }}
      LB_ALGO: wrr
      LB_KIND: DR
      REAL_SERVER_1_IP: {{ pillar['lvs-keepalived']['REAL_SERVER_1_IP'] }}
      REAL_SERVER_1_PORT: {{ pillar['lvs-keepalived']['REAL_SERVER_1_PORT'] }}
      REAL_SERVER_2_IP: {{ pillar['lvs-keepalived']['REAL_SERVER_2_IP'] }}
      REAL_SERVER_2_PORT: {{ pillar['lvs-keepalived']['REAL_SERVER_2_PORT'] }}

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
