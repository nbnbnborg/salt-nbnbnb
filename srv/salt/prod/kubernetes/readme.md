# description

1. tar or yum in ali?
fast :
tar: dream_ya 1master,2node
yum in ali: 《附录A 部署kubernetes集群.docx》P6 1master,3node

linuxk~docx
read i4t or mage~
https://www.qikqiak.com/tags/kubernetes/

salt: 
https://github.com/unixhot/kube-salt
https://github.com/opsnull/follow-me-install-kubernetes-cluster
* https://github.com/skymyyang/salt-k8s-ha/tree/1.13-Release

ansible:
https://github.com/zhangguanzhang/Kubernetes-ansible

ci cd:
https://www.qikqiak.com/tags/kubernetes/


2.etcd 无主 等价？

3.装完k8s, salt是主控制器 也需要 透过k8s master控制 node?

4.常规需要多少硬件资源？

4.CoreDNS or KubeDNS

5.360 danshbold wanye？

1.install:
  /etc/hosts
  chrony
  iptables&firewalld off
  selinux off
  swapoff -a

  repo.







demotest:
xt_kubernetes_master_01.nbnbnb.org
xt_kubernetes_node_01.nbnbnb.org
xt_kubernetes_node_02.nbnbnb.org

salt 'xt_kubernetes_*.nbnbnb.org' state.sls init.dns saltenv='base' -t 60
#  not to run
salt 'xt_kubernetes_*.nbnbnb.org' state.sls docker.service saltenv='prod' -t 600

# etcd,kubelet,fannel
salt 'xt_kubernetes_*.nbnbnb.org' state.sls kubernetes.install saltenv='prod' -t 600
salt 'xt_kubernetes_*.nbnbnb.org' state.sls kubernetes.service saltenv='prod' -t 600

# proxy
salt 'xt_kubernetes_node_*.nbnbnb.org' state.sls kubernetes.install-node saltenv='prod' -t 600
salt 'xt_kubernetes_node_*.nbnbnb.org' state.sls kubernetes.service-node saltenv='prod' -t 600

# api-server,scheduler,controller-manager
salt 'xt_kubernetes_master_01.nbnbnb.org' state.sls kubernetes.install-master saltenv='prod' -t 600
salt 'xt_kubernetes_master_01.nbnbnb.org' state.sls kubernetes.service-master saltenv='prod' -t 600

salt 'xt_kubernetes_*.nbnbnb.org' cmd.run 'kubelet '




