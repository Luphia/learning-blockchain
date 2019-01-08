# 如何導入區塊鏈
- Wallet: 區塊鏈的用戶帳號
- 架設鏈: Parity
- 與鏈溝通: REST API
- Smart Contract: https://cryptozombies.io/
- Backend: TideDog

## Wallet
* BIP32 - Hierarchical Deterministic wallet
* BIP39 – 助記辭
* BIP44 – 多幣種/帳戶支援
<p align="center">
  <img width="460" height="300" src="https://cdn-images-1.medium.com/max/2000/0*q7O_DreXk8dWeIz9.">
</p>

## TideDog
* 建立 Docker Image
```
cd docker/tidedog
docker image build -t tidedog .
```
* 啟動 Docker
```
docker run -t -i -p 8545 -p 80 -p 443 tidedog
```
* 安裝 library
```
npm i
```
* 修改相關檔案
```
vi libs/Test.js
vi config.toml
```
* 啟動服務
```
node bin/start.js -s
```
