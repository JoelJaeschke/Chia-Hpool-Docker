#!/bin/sh

if [ ! "$(ls -A /plots)" ]; then
	echo "Plots directory seems to be empty"
fi

cd /chia-miner/linux-arm64/

./hpool-chia-miner-linux-arm64 --config /chia-miner/config/config.yaml
