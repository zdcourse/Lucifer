docker run --hostname=quickstart.cloudera \
	--privileged=true -itd \
	-p 8888:8888 \
	-p 7180:7180 \
	-p 80:80 \
	-p 22
	cloudera-hadoop:latest \
	/usr/bin/docker-quickstart

