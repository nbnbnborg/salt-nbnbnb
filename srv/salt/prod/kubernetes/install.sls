swapoff:
  cmd.run:
    - name: swapoff -a && sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

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
      # cli
      - kubectl
      # deamon
      - kubelet
      # cluster init
      - kubeadm
    - require:
      - file: "kubernetes repo"

ipvs install:
  pkg.installed:
    - names:
      - ipvsadm
      - ipset
      - sysstat
      - libnetfilter_conntrack
      - libnetfilter_conntrack-devel
      - conntrack-tools
      - libnetfilter_cttimeout
      - libnetfilter_cttimeout-devel
      - libseccomp

/etc/modules-load.d/ipvs.conf:
  file.managed:
    - source: salt://kubernetes/ipvs.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: "ipvs install"

systemd-modules-load service:
  service.running:
    - name: systemd-modules-load
    - enable: True
    - reload: True

/etc/sysctl.d/k8s.conf:
  file.managed:
    - source: salt://kubernetes/k8s.conf
    - user: root
    - group: root
    - mode: 644

sysctl --system:
  cmd.run:
    - name: sysctl --system
    - require:
      - file: "/etc/sysctl.d/k8s.conf"


