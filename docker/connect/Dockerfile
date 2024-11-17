FROM confluentinc/cp-kafka-connect:7.5.3

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest && \
    confluent-hub install --no-prompt debezium/debezium-connector-sqlserver:latest

COPY jmx_prometheus_javaagent-1.0.1.jar /etc/kafka-connect/jars/jmx_prometheus_javaagent.jar

COPY --chown=appuser:root jmx_exporter.yaml /etc/kafka/

#ENV KAFKA_JMX_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -javaagent:/etc/kafka-connect/jars/jmx_prometheus_javaagent.jar=12345:/etc/kafka/jmx_exporter.yaml"

ENV KAFKA_JMX_OPTS=""
ENV KAFKA_JMX_OPTS="${KAFKA_JMX_OPTS} -Dcom.sun.management.jmxremote"
ENV KAFKA_JMX_OPTS="${KAFKA_JMX_OPTS} -Djava.rmi.server.hostname=connect"
ENV KAFKA_JMX_OPTS="${KAFKA_JMX_OPTS} -Dcom.sun.management.jmxremote.port=12345"
ENV KAFKA_JMX_OPTS="${KAFKA_JMX_OPTS} -Dcom.sun.management.jmxremote=true"
ENV KAFKA_JMX_OPTS="${KAFKA_JMX_OPTS} -Dcom.sun.management.jmxremote.authenticate=false"
ENV KAFKA_JMX_OPTS="${KAFKA_JMX_OPTS} -Dcom.sun.management.jmxremote.ssl=false"
ENV KAFKA_JMX_OPTS="${KAFKA_JMX_OPTS} -javaagent:/etc/kafka-connect/jars/jmx_prometheus_javaagent.jar=12346:/etc/kafka/jmx_exporter.yaml"



