# 前置準備

## Docker
* 安裝 Docker & Docker-Compose
```shell
# 移除舊有版本 (optional)
sudo apt-get remove docker docker-engine docker.io

# 更新套件清單
sudo apt-get update

# 安裝相依函示庫
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

# 加入 Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# 確認 fingerprint
sudo apt-key fingerprint 0EBFCD88
> pub   4096R/0EBFCD88 2017-02-22
>      Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
> uid                  Docker Release (CE deb) <docker@docker.com>
> sub   4096R/F273FCD8 2017-02-22

# 安裝 Docker 最新 stable 版本
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y

# 安裝 Docker-Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

* https://www.docker.com/get-started
* download ubuntu 16.04 image
```shell
docker pull ubuntu:16.04
```

## Slack
* https://slack.com/
* [登記 email](https://docs.google.com/spreadsheets/d/17HbiLC4vc8ax5_0Xyen7EIdrbpewvKCxk9q3RrALBZU/edit?usp=sharing)
* iiilearningblockchain.slack

## SourceTree
* https://www.sourcetreeapp.com/

### 下載教材
* New...
* Clone from URL
* https://github.com/Luphia/learning-blockchain/

### 建立 Docker
```shell
cd learning-blockchain/docker/tidedog
docker image build -t tidedog .
docker image ls
docker run -t -i -p 8545 -p 80 -p 443 tidedog
bin/start.js
ctrl + p + q
docker container ls
```

## Postman
* https://www.getpostman.com/
* import learning-blockchain/ETHRPC.postman_colletion.json
* setting environment

## Documents
* [Docker](https://docs.docker.com/)
* [Solidity](https://solidity.readthedocs.io/)
* [Solidity IDE](https://remix.ethereum.org)
* [Ethereum JSON-RPC](https://github.com/ethereum/wiki/wiki/JSON-RPC)
* [BIPs](https://github.com/bitcoin/bips)
* [EIPs](https://github.com/ethereum/EIPs)
* [XPA Exchange](https://xpa.exchange)
* [EtherScan](https://etherscan.io/)

## Videos
* [Blockchain](https://www.youtube.com/watch?v=SSo_EIwHSd4)
* [Blockchain TED](https://www.youtube.com/watch?v=Pl8OlkkwRpc)
* [ECDSA](https://www.youtube.com/watch?v=dCvB-mhkT0w)

## White Papers
* [Bitcoin](https://bitcoin.org/bitcoin.pdf)
* [Ethereum](https://ethereum.github.io/yellowpaper/paper.pdf)
