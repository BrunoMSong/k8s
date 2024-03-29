#!/bin/bash

#定义需要下载的镜像列表
images=(nfsplugin:v4.2.0)
#登陆阿里云镜像仓库，便于push镜像
docker login --username=finger_711 registry.cn-hangzhou.aliyuncs.com
#定义源和目的镜像仓库，便于拼接完整镜像名称
srcrepo="registry.k8s.io/sig-storage/"
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

