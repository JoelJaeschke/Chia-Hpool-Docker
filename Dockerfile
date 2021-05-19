FROM ubuntu:latest

WORKDIR /chia-miner

RUN apt-get update \
	&& apt-get install -y wget unzip

RUN wget -O /chia-miner/hpool-miner.zip https://github.com/hpool-dev/chia-miner/releases/download/v1.3.0-5/HPool-Miner-chia-v1.3.0-5-aarch64.zip

RUN unzip /chia-miner/hpool-miner.zip
RUN rm -rf /chia-miner/hpool-miner.zip

RUN chmod +x /chia-miner/linux-arm64/hpool-chia-miner-linux-arm64

RUN mkdir /plots
RUN mkdir /chia-miner/config

ADD ./run_miner.sh run_miner.sh

ENTRYPOINT ["/bin/sh", "run_miner.sh"]
