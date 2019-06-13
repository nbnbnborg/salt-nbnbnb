include:
  - kubernetes.install
  #- soft.conf

kubelet service:
  service.running:
    - name: kubelet
    - enable: True
    - reload: True
    #- require:
    #  - file: /etc/soft.conf
    #- watch:
    #  - file: /etc/soft.conf


