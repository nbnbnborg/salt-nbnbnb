lvs-loadblance:
  - name: lvstest
    vip: 192.168.56.10
    vip-nic: eth0
    port: 80
    protocol: tcp
    scheduler: wlc
    realservers:
      - name: linux-node2
        ip: 192.168.56.12
        port: 80
        packet_forward_method: dr
        weight: 10
      - name: linux-node3
        ip: 192.168.56.13
        port: 80
        packet_forward_method: dr
        weight: 30 
        
