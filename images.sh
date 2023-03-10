#!/bin/bash
  
images=(kube-apiserver:v1.24.11 kube-controller-manager:v1.24.11 kube-scheduler:v1.24.11 kube-proxy:v1.24.11)
docker login --username=finger_711 registry.cn-hangzhou.aliyuncs.com
##获取阿里云仓库的账号密码，方便后续登陆 
#cho “请输入容器仓库登陆账号：”
#read username
#echo “请输入密码：”
#read password
srcrepo="registry.k8s.io/"
destrepo="registry.cn-hangzhou.aliyuncs.com/finger-k8s/"
for i in "${images[@]}" ; do
    docker pull $srcrepo$i
    docker tag $srcrepo$i $destrepo$i
    docker push $destrepo$i
    if [ $? -eq 0 ]; then
        echo "$destrepo$i 同步成功"
    else
        echo “$destrepo$i 同步失败”
    fi
done

