# Deploy Ethereum to Ubuntu 16.04

## Create User
```shell
adduser ubuntu
adduser ubuntu sudo
su ubuntu
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
sudo apt-get update
sudo apt-get install openssl libtool autoconf automake uuid-dev build-essential gcc g++ python-software-properties unzip make git libcap2-bin vim curl wget sudo screen -y
```

## Install Parity
```shell
bash <(curl https://get.parity.io -kL)
```

## Prepare Runtime Folder
```shell
mkdir parity
cd parity
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
        "gasLimitBoundDivisor": "0x400",
        "stepDuration": "3",
        "validators" : {
          "list": [
            "0x7d04e22b7b4bd658ecb74bd97c7031b02c5060eb",
            "0x7a96a850eddd0f635b9d7ec867b13a380069bedc"
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
    "eip86Transition": 0,
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
author = "0x7a96a850eddd0f635b9d7ec867b13a380069bedc"
engine_signer = "0x7a96a850eddd0f635b9d7ec867b13a380069bedc"

[account]
unlock = ["0x7a96a850eddd0f635b9d7ec867b13a380069bedc"]
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
