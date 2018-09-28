# aria2-nginx-alpine-webui

- Dockerfile定制使用基础镜像为基于alpine的nginx(nginx:1.15.4-alpine)
- 镜像制作完成大小约29MB
- 可以使用自定义配置或者默认配置

### 配置定制

`default.conf`

```
nginx的默认配置，构建镜像时候默认打包替换/etc/nginx/conf.d/default.conf，默认使用容器的80端口
```

`aria2.conf`

```
aria2相关的配置文件，文件注释已经有大部分说明；
配置文件如果看不懂，一般情况下只需要自定义aria2访问密钥(即配置rpc-secret)
```

`shell.sh`

```
此文件是构建命令、创建和运行容器的启动脚本
```

### 构建步骤

执行一下命令进行默认构建镜像操作:
```
git clone https://github.com/hdfg159/aria2-nginx-alpine-webui.git \
&& cd aria2-nginx-alpine-webui \
&& chmod 755 shell.sh \
&& ./shell.sh
```
默认构建会使用到主机的6800端口(aria2 rpc port)和80端口(nginx)

如需自定义使用其他端口和下载文件的主机路径，请修改shell.sh:

eg:
```
docker build -t aria2-nginx-alpine . \
&& docker run --name=aria2-nginx-80 --restart=always -v <主机存放目录>:/home -p <nginx端口>:80 -p <aria2 rpc 端口>:6800 -itd aria2-nginx-alpine  
```
如果需要额外指定主机上nginx配置和主机上的aria2配置需要添加一些参数，请修改shell.sh:

eg:
```
docker build -t aria2-nginx-alpine . \
&& docker run --name=aria2-nginx-80 --restart=always -v <主机存放目录>:/home -p <nginx端口>:80 -p <aria2 rpc 端口>:6800 -v <nginx.conf路径>:/etc/nginx/nginx.conf -v <aria2.conf路径>:/root/.aria2/aria2.conf -itd aria2-nginx-alpine  
```
### 反馈

请反馈至 [Github Issues](https://github.com/hdfg159/aria2-nginx-alpine-webui/issues).

### 链接

- [webui-aria2](https://github.com/ziahamza/webui-aria2)

- [docker-nginx](https://github.com/nginxinc/docker-nginx)

- [aria2](https://aria2.github.io)

- [alpine](https://www.alpinelinux.org)
