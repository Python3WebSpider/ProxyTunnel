FROM ubuntu
RUN apt update\
	&& apt -y install squid
COPY squid.conf /etc/squid/squid.conf
WORKDIR /app
COPY start.sh .
RUN chmod +x start.sh

EXPOSE 3128/tcp
CMD ["./start.sh"]