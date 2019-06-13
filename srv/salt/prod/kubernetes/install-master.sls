pull kubernetes images:
  file.managed:
    - name: /etc/kubernetes/get_kubernetes_docker_images.sh
    - source: salt://kubernetes/get_kubernetes_docker_images.sh
    - user: root
    - group: root
    - mode: 754
  cmd.run:
    - name: "/bin/bash /etc/kubernetes/get_kubernetes_docker_images.sh"
    - require:
      - file: "pull kubernetes images"

#kubeadm init:
#  cmd.run:
#    # 0.0.0.0 could be change.
#    - name: "kubeadm init --kubernetes-version=v1.14.1 --pod-network-cidr=10.244.0.0/16 --service-cidr=10.96.0.0/12 --apiserver-advertise-address=0.0.0.0"
