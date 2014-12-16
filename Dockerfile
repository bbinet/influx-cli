FROM google/golang

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends libreadline-gplv2-dev

WORKDIR /gopath/src/influx-cli
ADD . /gopath/src/influx-cli/
RUN go get influx-cli

CMD []
ENTRYPOINT ["/gopath/bin/influx-cli"]
