build: 
	docker build -t tftpd .

run: 
	docker run -it -d -p 69:69/udp --name=tftpd -v $PWD/tftp:/srv/tftp tftpd
