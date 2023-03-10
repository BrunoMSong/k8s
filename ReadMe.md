此项目用于获取k8s及相关镜像。dokcer官方提供了一个免费demo实例环境，实例是海外部署，可直接获取K8S镜像，再通过此此例将下载的镜像上传到自己的阿里云镜像仓库；
需要：docker hub账号，外网能访问的镜像仓库（本例使用阿里云容器服务）

1、注册好阿里云账号，并开通容器服务；
2、注册dockerhub账号，并登陆https://labs.play-with-docker.com/ 
3、docker labs实例中获取github脚本，自动对需要的镜像进行下载并上传会阿里云镜像
