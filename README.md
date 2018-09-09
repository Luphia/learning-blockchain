# learning-blockchain
The sample code for learning blockchain

## Docker Command
```
# 列出 container 清單
docker container ls -a

# 查看 container 詳細資訊
docker container inspect ${container_id}

# 中斷 container
docker container kill ${container_id}

# 查看 container logs
docker container logs ${container_id}

# 刪除 container
docker container rm

# 列出 image 清單
docker image ls -a

# 建立 image
docker image build -t ${image_name} path/to/Dockerfile

# 啟動 container
docker run -t -i ${image_name} [${shell_command}]

# 啟動 container 並開啟 port mapping
docker run -t -i -p 8545 -p 80 -p 443 ${image_name}

# 跳出 container 連線
docker detach: ctrl + p + q

# container 重新連線
docker attach ${container_id}
```

## Simply Explained of Blockchain
https://www.youtube.com/watch?v=SSo_EIwHSd4
