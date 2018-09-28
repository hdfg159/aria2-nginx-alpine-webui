docker build -t aria2-nginx-alpine . \
&& docker run --name=aria2-nginx-80 --restart=always -v /root/download:/home -p 80:80 -p 6800:6800 -itd aria2-nginx-alpine