#!/bin/bash/	
echo "=========================================================="
echo "Pull Kubernetes v1.14.1 Images from aliyuncs.com ......"
echo "=========================================================="

MY_REGISTRY=registry.cn-hangzhou.aliyuncs.com/openthings       

##拉取镜像
docker pull ${MY_REGISTRY}/k8s-gcr-io-kube-apiserver:v1.14.1
docker pull ${MY_REGISTRY}/k8s-gcr-io-kube-controller-manager:v1.14.1
docker pull ${MY_REGISTRY}/k8s-gcr-io-kube-scheduler:v1.14.1
docker pull ${MY_REGISTRY}/k8s-gcr-io-kube-proxy:v1.14.1
docker pull ${MY_REGISTRY}/k8s-gcr-io-etcd:3.3.10
docker pull ${MY_REGISTRY}/k8s-gcr-io-pause:3.1
docker pull ${MY_REGISTRY}/k8s-gcr-io-coredns:1.3.1

##添加Tag
docker tag ${MY_REGISTRY}/k8s-gcr-io-kube-apiserver:v1.14.1 k8s.gcr.io/kube-apiserver:v1.14.1
docker tag ${MY_REGISTRY}/k8s-gcr-io-kube-scheduler:v1.14.1 k8s.gcr.io/kube-scheduler:v1.14.1
docker tag ${MY_REGISTRY}/k8s-gcr-io-kube-controller-manager:v1.14.1 k8s.gcr.io/kube-controller-manager:v1.14.1
docker tag ${MY_REGISTRY}/k8s-gcr-io-kube-proxy:v1.14.1 k8s.gcr.io/kube-proxy:v1.14.1
docker tag ${MY_REGISTRY}/k8s-gcr-io-etcd:3.3.10 k8s.gcr.io/etcd:3.3.10
docker tag ${MY_REGISTRY}/k8s-gcr-io-pause:3.1 k8s.gcr.io/pause:3.1
docker tag ${MY_REGISTRY}/k8s-gcr-io-coredns:1.3.1 k8s.gcr.io/coredns:1.3.1

##删除镜像
docker rmi ${MY_REGISTRY}/k8s-gcr-io-kube-apiserver:v1.14.1
docker rmi ${MY_REGISTRY}/k8s-gcr-io-kube-controller-manager:v1.14.1
docker rmi ${MY_REGISTRY}/k8s-gcr-io-kube-scheduler:v1.14.1
docker rmi ${MY_REGISTRY}/k8s-gcr-io-kube-proxy:v1.14.1
docker rmi ${MY_REGISTRY}/k8s-gcr-io-etcd:3.3.10
docker rmi ${MY_REGISTRY}/k8s-gcr-io-pause:3.1
docker rmi ${MY_REGISTRY}/k8s-gcr-io-coredns:1.3.1

echo "=========================================================="
echo "镜像源自：“registry.cn-hangzhou.aliyuncs.com/openthings"
echo "=========================================================="

