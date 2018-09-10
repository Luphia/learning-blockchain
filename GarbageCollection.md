# 環境復原
課程結束後只需要執行以下流程，本機環境便會回復到上課前狀態  

## 停止並刪除所有 docker container
```shell
# 查詢所有運作中的 container
docker container ls

# 關閉所有運作中的 container
docker kill ${container_id}

# 查詢所有靜止的 container
docker container ls -a

# 刪除所有靜止的 container
docker container rm ${container_id}
```

## 刪除所有 Image
```
# 查詢所有 image
docker image ls

# 刪除所有 image
docker image rm ${image_id}
```
