from centos:7
LABEL piataevyus <piataevyus@example.com>

RUN yum install wget -y
RUN yum install -y java-11-openjdk wget curl perl-Digest-SHA

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.17.3-linux-x86_64.tar.gz
RUN mkdir /usr/elasticsearch && \
        mv elasticsearch-7.17.3-linux-x86_64.tar.gz /usr/elasticsearch && \
        cd /usr/elasticsearch && \
        tar -xzf elasticsearch-7.17.3-linux-x86_64.tar.gz

COPY elasticsearch.yml /usr/elasticsearch/elasticsearch-7.17.3/config/elasticsearch.yml

RUN groupadd elasticsearch && \
        useradd elasticsearch -g elasticsearch -p elasticsearch && \
        chown -R elasticsearch:elasticsearch /usr/elasticsearch

RUN mkdir /var/lib/data && \
        chown -R elasticsearch:elasticsearch /var/lib/data && \
        mkdir /var/lib/logs && \
        chown -R elasticsearch:elasticsearch /var/lib/logs && \
	mkdir /usr/elasticsearch/elasticsearch-7.17.3/snapshots && \
        chown -R elasticsearch:elasticsearch /usr/elasticsearch/elasticsearch-7.17.3/snapshots

USER elasticsearch

CMD ["/usr/sbin/init"]
CMD ["/usr/elasticsearch/elasticsearch-7.17.3/bin/elasticsearch"]
