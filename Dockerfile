FROM neo4j:2.3.2

COPY ./csv/ /movies_csv/

COPY ./start.sh ./start.sh

RUN sed -i -e "s/#org.neo4j.server.webserver.address=0.0.0.0/org.neo4j.server.webserver.address=0.0.0.0/g" conf/neo4j-server.properties

RUN chmod +x ./start.sh