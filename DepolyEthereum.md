# Deploy Ethereum to Ubuntu 16.04

## Create User
```shell
adduser ubuntu
adduser ubuntu sudo
```

## Setup SWAP
```shell
sudo swapon -s
sudo free -m
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

## Install library
```shell
apt-get update
apt-get install openssl libtool autoconf automake uuid-dev build-essential gcc g++ python-software-properties unzip make git libcap2-bin vim curl wget sudo screen -y
```
## Switch to ubuntu
```shell
su ubuntu
```

## Install Parity
```shell
bash <(curl https://get.parity.io -kL)
```

## Prepare Runtime Folder
```shell
cd ~
mkdir parity
cd parity
```

## Create Wallet
```shell
parity --keys-path /home/ubuntu/parity/keys account new
vi /home/ubuntu/parity/.pw
```

## Setup Genesis Block
```shell
vi genesis.json
```
```json
{
  "name": "MainChain",
  "engine": {
    "authorityRound": {
      "params": {
        "stepDuration": "3",
        "validators" : {
          "list": [
            "${YOUR ADDRESS}"
          ]
        }
      }
    }
  },
  "params": {
    "gasLimitBoundDivisor": "0x400",
    "maximumExtraDataSize": "0x20",
    "minGasLimit": "0x5208",
    "networkID" : "0x1",
    "eip155Transition": 0,
    "eip98Transition": 0,
    "eip140Transition": 0,
    "eip211Transition": 0,
    "eip214Transition": 0,
    "eip658Transition": 0
  },
  "genesis": {
    "seal": {
      "authorityRound": {
        "step": "0x0",
        "signature": "0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
      }
    },
    "difficulty": "0x20000",
    "gasLimit": "0x47B760"
  },
  "accounts": {
    "0x0000000000000000000000000000000000000001": { "balance": "1", "builtin": { "name": "ecrecover", "pricing": { "linear": { "base": 3000, "word": 0 } } } },
    "0x0000000000000000000000000000000000000002": { "balance": "1", "builtin": { "name": "sha256", "pricing": { "linear": { "base": 60, "word": 12 } } } },
    "0x0000000000000000000000000000000000000003": { "balance": "1", "builtin": { "name": "ripemd160", "pricing": { "linear": { "base": 600, "word": 120 } } } },
    "0x0000000000000000000000000000000000000004": { "balance": "1", "builtin": { "name": "identity", "pricing": { "linear": { "base": 15, "word": 3 } } } },
    "0x49aa79070f27f2fa4c375586eaf03c862cad26e9": { "balance": "1000000000000000000000000000000000000" }
  }
}
```

## Setup Parity Config
```shell
vi config.toml
```
```toml
[parity]
chain = "/home/ubuntu/parity/genesis.json"
base_path = "/home/ubuntu/parity"
keys_path = "/home/ubuntu/parity/keys"

[footprint]
tracing = "off"
pruning = "archive"

[network]
port = 30300

[mining]
author = "${YOUR ADDRESS}"
engine_signer = "${YOUR ADDRESS}"

[account]
unlock = ["${YOUR ADDRESS}"]
password = ["/home/ubuntu/parity/.pw"]
keys_iterations = 10240

[rpc]
port = 5645
interface = "0.0.0.0"
cors = ["all"]
#apis = ["web3", "eth", "net", "personal", "parity", "parity_set", "traces", "rpc", "parity_accounts"]
apis = ["web3", "eth", "net", "parity", "parity_set", "rpc"]

[ipc]
apis = ["web3", "eth", "net", "parity", "parity_accounts", "personal", "traces", "rpc", "secretstore"]
```

## Create 2 Wallets
```shell
echo "YOUR_PASSWORD" > $HOME/parity/.pw
sh -c '/bin/echo -e "YOUR_PASSWORD\nYOUR_PASSWORD" | parity --config $HOME/parity/config.toml account new | grep -o '0x[0-9a-f]*'
```

## Start Parity
```shell
screen parity --config $HOME/parity/config.toml
```

## Add Node
```shell
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"jsonrpc":"2.0", "method":"parity_addReservedPeer", "params":["enode://7528334ff7e4823b19be4a39c4e5661bbddac2dab1615362fa4089e41d5019e6164295f27efc6baac2ea74edcd302750f051a577eabeb1c81de8073277515a25@172.16.0.7:30300"], "id":0}' \
  http://127.0.0.1:5645
```
