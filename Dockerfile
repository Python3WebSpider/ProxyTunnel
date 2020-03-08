FROM ubuntu:18.04
RUN apt update\
	&& apt -y install squid\
	&& apt -y install apache2-utils\
	&& rm -rf /var/lib/apt/lists/*
COPY squid.conf /etc/squid/squid.conf
COPY auth.conf /etc/squid/auth.conf
WORKDIR /app
COPY start.sh .
RUN chmod +x start.sh

EXPOSE 3128/tcp
CMD ["./start.sh"]