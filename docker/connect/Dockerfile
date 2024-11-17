FROM confluentinc/cp-kafka-connect:7.5.3

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest && \
    confluent-hub install --no-prompt debezium/debezium-connector-sqlserver:latest

ARG AGENT_MAVEN_PATH=https://repo.maven.apache.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent
ARG AGENT_JAR_PATH=/etc/kafka-connect/jars/jmx_prometheus_javaagent.jar
ARG EXPORTER_CONFIG_PATH=/etc/kafka/jmx_exporter.yaml

RUN LATEST_AGENT=$( \
        curl -s ${AGENT_MAVEN_PATH}/maven-metadata.xml \
        | xmllint --xpath "string(//metadata/versioning/latest)" - \
    ) && \
    curl --location --output ${AGENT_JAR_PATH} \
      ${AGENT_MAVEN_PATH}/${LATEST_VERSION}/jmx_prometheus_javaagent-${LATEST_VERSION}.jar

COPY --chown=appuser:root jmx_exporter.yaml ${EXPORTER_CONFIG_PATH}

ENV KAFKA_JMX_OPTS=""
ENV KAFKA_JMX_OPTS="${KAFKA_JMX_OPTS} -Dcom.sun.management.jmxremote"
ENV KAFKA_JMX_OPTS="${KAFKA_JMX_OPTS} -Djava.rmi.server.hostname=connect"
ENV KAFKA_JMX_OPTS="${KAFKA_JMX_OPTS} -Dcom.sun.management.jmxremote.port=12345"
ENV KAFKA_JMX_OPTS="${KAFKA_JMX_OPTS} -Dcom.sun.management.jmxremote=true"
ENV KAFKA_JMX_OPTS="${KAFKA_JMX_OPTS} -Dcom.sun.management.jmxremote.authenticate=false"
ENV KAFKA_JMX_OPTS="${KAFKA_JMX_OPTS} -Dcom.sun.management.jmxremote.ssl=false"
ENV KAFKA_JMX_OPTS="${KAFKA_JMX_OPTS} -javaagent:${AGENT_JAR_PATH}=12346:${EXPORTER_CONFIG_PATH}"



