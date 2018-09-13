FROM ubuntu:16.04
LABEL maintainer="Luphia (luphia.chang@tideisun.com)"
EXPOSE 8545

WORKDIR /root
RUN apt-get update
RUN apt-get install openssl libtool autoconf automake uuid-dev build-essential gcc g++ python-software-properties unzip make git libcap2-bin vim curl wget sudo screen -y
RUN useradd ubuntu -ms /bin/bash
RUN tmppw=$(date +%s | sha256sum | base64 | head -c 32 ; echo) && echo "ubuntu:${tmppw}" | chpasswd
RUN adduser ubuntu sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ubuntu
WORKDIR /home/ubuntu
RUN /bin/bash -c 'bash <(curl https://raw.githubusercontent.com/Luphia/SIMPLE/master/shell/install-bc2.sh -kL)'
RUN /bin/bash -c 'bash <(curl https://get.parity.io -kL)'
RUN mkdir parity
RUN mkdir parity/keys
RUN mkdir parity/keys/MainChain
COPY genesis.json /home/ubuntu/parity/genesis.json
COPY config.toml /home/ubuntu/parity/config.toml
RUN keypw=$(date +%s | sha256sum | base64 | head -c 32 ; echo) && \
echo $keypw > parity/.pw && \
newkey=$(echo "$keypw\n$keypw" | parity account new --keys-path /home/ubuntu/parity/keys --chain /home/ubuntu/parity/genesis.json | grep -Po "0x[0-9a-f]*") && \
sed -i "s/0x7a96a850eddd0f635b9d7ec867b13a380069bedc/$newkey/g" /home/ubuntu/parity/genesis.json && \
sed -i "s/0x7a96a850eddd0f635b9d7ec867b13a380069bedc/$newkey/g" /home/ubuntu/parity/config.toml

CMD parity --config $HOME/parity/config.toml