FROM	debian:buster-20220125

RUN		apt-get update -y && \
		apt-get install -y nginx=1.14.2-2+deb10u4 && \
		apt-get install -y openssl=1.1.1d-0+deb10u7 && \
		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
			-subj "/C=BE/ST=BXL/O=19, Inc./CN=nde-koni.42.fr" \
			-addext "subjectAltName=DNS:nde-koni.42.fr" \
			-keyout /etc/ssl/private/nginx-selfsigned.key \
			-out /etc/ssl/certs/nginx-selfsigned.crt;

COPY	./conf/default.conf /etc/nginx/conf.d/default.conf

CMD		["nginx", "-g", "daemon off;"]