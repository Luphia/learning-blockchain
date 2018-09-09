# 前置準備

## Docker
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
[Docker](https://docs.docker.com/)
[Solidity](https://solidity.readthedocs.io/)
[Solidity IDE](https://remix.ethereum.org)
[Ethereum JSON-RPC](https://github.com/ethereum/wiki/wiki/JSON-RPC)
[BIPs](https://github.com/bitcoin/bips)
[XPA Exchange](https://xpa.exchange)
[EtherScan](https://etherscan.io/)

## Videos
[Blockchain](https://www.youtube.com/watch?v=SSo_EIwHSd4)
[Blockchain TED](https://www.youtube.com/watch?v=Pl8OlkkwRpc)
[ECDSA](https://www.youtube.com/watch?v=dCvB-mhkT0w)

## White Papers
[Bitcoin](https://bitcoin.org/bitcoin.pdf)
[Ethereum](https://ethereum.github.io/yellowpaper/paper.pdf)