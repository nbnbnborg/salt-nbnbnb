kubernetes repo:
  file.managed:
    - name: /etc/yum.repos.d/kubernetes.repo
    - source: salt://kubernetes/kubernetes.repo.template
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - default:
      GPGCHECK: 0

kubernetes install:
  pkg.installed:
    - names:
      - kubectl
      - kubelet
      - kubeadm
    - require:
      - file: "kubernetes repo"
