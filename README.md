## 智能家庭中心

使用`docker-compose`, 在废旧电脑上一键搭建智能家庭服务

### 使用方法

#### 下载本仓库
```bash
$ git clone https://github.com/crazygit/family-media-center.git
$ cd family-media-center
```

#### 编辑配置文件

根据自身情况修改`run.sh`脚本中默认配置的路径

``` bash
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
/data/service/samba/shared
"
```

根据自身网络情况,修改openwrt的配置文件`config/network`

```bash
config interface 'lan'
        #option type 'bridge'
        option ifname 'eth0'
        option proto 'static'
        # 分配给openwrt系统的IP地址
        option ipaddr '192.168.2.126'
        # 子网掩码
        option netmask '255.255.255.0'
        # 主路由的网关
        option gateway '192.168.2.1'
        # 主路由的DNS
        option dns '192.168.2.1'
        # 广播地址
        option broadcast '192.168.2.255'
        #option ip6assign '60'
```


运行:

```bash
$ bash run.sh
```

### 服务访问方式

* jellyfin: <http://yourt_ip:8096>
* tiny_media_manager: <http://yourt_ip:5096>
* aria_ng: <http://yourt_ip:8800>
* kodi: <http://yourt_ip:8080>
* OpenWrt: <http://your_openwrt_static_ip>
