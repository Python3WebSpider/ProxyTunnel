FROM ubuntu
RUN apt update\
	&& apt -y install squid\
	&& apt -y install apache2-utils
COPY squid.conf /etc/squid/squid.conf
COPY auth.conf /etc/squid/auth.conf
WORKDIR /app
COPY start.sh .
RUN chmod +x start.sh

EXPOSE 3128/tcp
CMD ["./start.sh"]