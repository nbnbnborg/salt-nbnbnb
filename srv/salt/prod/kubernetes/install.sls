kernel update:
  #pkg.installed:
  #  - names: 
  #    - kernel-ml
  #    - kernel-ml-devel
  #  - fromrepo:
  #    - elrepo-kernel
  cmd.run:
    # awk -F\' '$1=="menuentry " {print $2}' /etc/grub2.cfg && uname -a
    - name: "yum --disablerepo='*' --enablerepo='elrepo-kernel' install -y kernel-ml kernel-ml-devel && sed -i 's/GRUB_DEFAULT=saved/GRUB_DEFAULT=0/g'  /etc/default/grub && grub2-mkconfig -o /boot/grub2/grub.cfg"

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
