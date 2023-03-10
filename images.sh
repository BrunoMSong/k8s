#!/bin/bash
  
images=(kube-apiserver:v1.23.17 kube-controller-manager:v1.23.17 kube-scheduler:v1.23.17)
docker login --username=finger_711 registry.cn-hangzhou.aliyuncs.com
##获取阿里云仓库的账号密码，方便后续登陆 
#cho “请输入容器仓库登陆账号：”
#read username
#echo “请输入密码：”
#read password
srcrepo="regitstry.k8s.io/"
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
    echo “所有镜像同步完成”
done

