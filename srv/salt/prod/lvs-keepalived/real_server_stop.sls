real_server stop:
  cmd.run:
    #- name: /opt/shell/ipvs_client.sh stop
    - name: /root/ipvs_client.sh stop
    - unless: test ${test -f /opt/shell/ipvs_client.sh} = 1

remove real_server_script:
  file.absent:
    #- name: /opt/shell/ipvs_client.sh
    - name: /root/ipvs_client.sh
