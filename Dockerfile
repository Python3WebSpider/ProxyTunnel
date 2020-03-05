FROM ubuntu
RUN apt update\
	&& apt -y install squid
WORKDIR /etc/squid
RUN echo "$PEERS_CONF" > peers.conf \
	&& echo "$SQUID_CONF" > squid.conf
RUN ls \
	&& cat squid.conf \
	&& cat peers.conf
EXPOSE 3128
CMD ["service", "squid", "start"]