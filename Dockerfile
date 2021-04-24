FROM ghcr.io/ovrclk/akash:0.12.1
LABEL org.opencontainers.image.source https://github.com/ovrclk/akash-on-akash

EXPOSE 8080
EXPOSE 26656
EXPOSE 26657
EXPOSE 1317
EXPOSE 9090

RUN apt-get update && apt-get install --no-install-recommends --assume-yes ca-certificates python3 python3-toml p7zip-full curl && apt-get clean
RUN yes | apt-get install wget


RUN mkdir /node

COPY app.toml /node/
COPY config.toml /node/
COPY genesis.json /node/
COPY setup.sh /node/

RUN ulimit -n 65530

RUN export GOPATH=/usr/local/go
RUN export GOROOT=$GOPATH
RUN export GOBIN=$GOPATH/bin

RUN export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:~/bin:/root/.local/bin:usr/local/go/:$GOROOT/bin:$GOPATH/bin:$GOBIN:$PATH"

RUN /node/setup.sh

COPY desmos /usr/bin/

COPY run.sh /node/
RUN chmod 555 /node/run.sh

COPY ./patch_config_toml.py /node/

CMD /node/run.sh
