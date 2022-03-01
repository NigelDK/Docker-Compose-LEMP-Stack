FROM debian:buster-20220125

RUN apt-get update -y && \
	apt-get install -y mariadb-server=1:10.3.31-0+deb10u1

COPY ./tools /tools

EXPOSE 3306

ENTRYPOINT	["sh", "/tools/configure.sh"]