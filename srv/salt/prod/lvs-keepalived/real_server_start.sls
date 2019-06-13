real_server_script:
  file.managed: 
    #- name: /opt/shell/ipvs_client.sh
    - name: /root/ipvs_client.sh
    - source: salt://lvs-keepalived/ipvs_client.sh.template
    #- template: jinja
    - user: root
    - group: root
    - mode: 776
    #- default:
    #  VIP: {{ pillar['lvs-keepalived']['VIP'] }}

real_server run:
  cmd.run:
    #- name: /opt/shell/ipvs_client.sh start
    - name: /root/ipvs_client.sh start
    - require: 
      - file: "real_server_script"

