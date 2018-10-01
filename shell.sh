docker build -t hdfg159/aria2-nginx-ariang . \
&& docker run --name=aria2-nginx-ariang-80 --restart=always -v /root/download:/home -p 80:80 -p 6800:6800 -itd hdfg159/aria2-nginx-ariang