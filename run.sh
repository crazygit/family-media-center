#!/bin/bash

export PUID=$(id -u)
export PGID=$(id -g)
# Aria2的RPC密码
export ARIA2_PRC_SECRET="your_secret"
export COMPOSE_PROJECT_NAME="family-media-center"

# 各个服务挂载到本机的目录
volumes="
/data/service/jellyfin/config
/data/service/jellyfin/cache
/data/service/jellyfin/media
/data/service/tiny_media_manager/config
/data/service/aria2/config
/data/service/aria2/downloads
/data/service/kodi/config
"

for volume in $volumes
do
    echo $volume
    test -d $volume || mkdir -p $volume
done

docker-compose -f docker-compose.aria2.yml \
               -f docker-compose.jellyfin.yml \
               -f docker-compose.kodi.yml \
               -f docker-compose.openwrt.yml \
               -f docker-compose.samba.yml \
               -f docker-compose.tiny_media_manager.yml \
               $@
