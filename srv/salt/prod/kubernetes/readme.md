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
推荐使用 多副本 部署，不过简单可以 直接放在一台master上。

3.cgroupfs or systemd.
官方推荐systemd,马哥书cgroups,kubernetes权威指南systemd.


3.部署方式：
minikube(单机)，kubeadm(集群化部署),手工构建（复杂）.
  kubeadm init:master
  kubeadm join:node
  kubeadm token:token
  kubeadm reset:重置

4.装完k8s, salt是主控制器 也需要 透过k8s master控制 node?
saltstack通过kubeadm创建kubernetes cluster.
创建完成后，由kubectl（cli）、Danshbord（GUI）、API（Restful Code）管理

5.常规需要多少硬件资源？
最低2CPU+2GMEM * 3

6.CoreDNS or KubeDNS
CoreDNS

7.Pod Controller:
replication colltroller,deployment,StatefulSet,DaemonSet,Jobs

8.monitor:
HeapSter or Prometheus.

9.scaler:
no:replication controller,Horizontal Pod Autoscaler(HPA)


10.official danshbord or 360 danshbord wanye？
run it
官方的功能，官方的缺点。
wanye的优点。



1.install:
  /etc/hosts
  chrony
  iptables&firewalld off
  selinux off
  swapoff -a
  repo





demotest:
must 2GMEM 2CPU(install ask)
xt-kubernetes-master-01.nbnbnb.org
xt-kubernetes-node-01.nbnbnb.org
xt-kubernetes-node-02.nbnbnb.org
xt-kubernetes-node-03.nbnbnb.org

salt 'xt-kubernetes-*.nbnbnb.org' state.sls init.dns saltenv='base' -t 60
# start
salt 'xt-kubernetes-*.nbnbnb.org' state.sls docker.service saltenv='prod' -t 600

# etcd,kubelet,fannel
salt 'xt-kubernetes-*.nbnbnb.org' state.sls kubernetes.install saltenv='prod' -t 600

salt 'xt-kubernetes-*.nbnbnb.org' state.sls kubernetes.install-master saltenv='prod' -t 600

master:
kubeadm init \
             --kubernetes-version=v1.14.1 \
             --pod-network-cidr=10.244.0.0/16 \
             --service-cidr=10.96.0.0/12 \
             --apiserver-advertise-address=0.0.0.0

look at install-master.log get token.

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

#kubectl get compontsstatuses
kubectl get cs
kubectl get nodes

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl get nodes

kubectl get pods -n kube-system|grep flannel
# wait 1 mintue 
kubectl get nodes


salt 'xt-kubernetes-*.nbnbnb.org' state.sls kubernetes.service saltenv='prod' -t 600

# proxy
salt 'xt-kubernetes-node-*.nbnbnb.org' state.sls kubernetes.install-node saltenv='prod' -t 600
salt 'xt-kubernetes-node-*.nbnbnb.org' state.sls kubernetes.service-node saltenv='prod' -t 600

# api-server,scheduler,controller-manager
salt 'xt-kubernetes-master-01.nbnbnb.org' state.sls kubernetes.install-master saltenv='prod' -t 600
salt 'xt-kubernetes-master-01.nbnbnb.org' state.sls kubernetes.service-master saltenv='prod' -t 600

salt 'xt-kubernetes-*.nbnbnb.org' cmd.run 'kubelet '




