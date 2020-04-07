#!/bin/bash

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

PUID=$(id -u) PGID=$(id -g) ARIA2_PRC_SECRET="your_secret" COMPOSE_PROJECT_NAME="family-media-center" docker-compose up --build -d
