kubelet stop:
  service.dead:
    - name: kubelet
    - enable: False
