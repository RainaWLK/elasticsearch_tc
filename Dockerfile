FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.2.3

MAINTAINER RainaWlk <lukeshih72@gmail.com>

COPY --chown=elasticsearch:elasticsearch ./config/* /usr/share/elasticsearch/config/

RUN ./bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.2.3/elasticsearch-analysis-ik-6.2.3.zip

ADD https://github.com/samejack/sc-dictionary/raw/master/main.txt /usr/share/elasticsearch/config/analysis-ik/sc-dictionary.dic
RUN mv /usr/share/elasticsearch/config/IKAnalyzer.cfg.xml /usr/share/elasticsearch/config/analysis-ik/

RUN chown elasticsearch:root -R /usr/share/elasticsearch

#ENTRYPOINT /bin/sh

EXPOSE 9200
