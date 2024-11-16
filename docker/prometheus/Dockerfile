FROM ubuntu

RUN apt-get update && \
    apt-get install -y \
      curl

RUN mkdir /app &&  \
    cd /app && \
    export LATEST_VERSION=$(curl -s https://api.github.com/repos/prometheus/prometheus/releases/latest | grep tag_name | cut -d '"' -f 4) && \
    curl -o prometheus.tar.gz  \
      --location  \
    https://github.com/prometheus/prometheus/releases/download/${LATEST_VERSION}/prometheus-${LATEST_VERSION#v}.linux-amd64.tar.gz && \
    tar xvfz prometheus.tar.gz --strip-components=1

WORKDIR /app

CMD ["./prometheus", "--config.file=prometheus.yml"]

EXPOSE 9090