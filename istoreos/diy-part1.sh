#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# git clone https://github.com/hangyubin/homeproxy.git package/homeproxy
echo 'src-git nas https://github.com/linkease/nas-packages.git;master' >> feeds.conf.default
echo 'src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' >> feeds.conf.default
echo 'src-git diskman https://github.com/jjm2473/luci-app-diskman;dev' >> feeds.conf.default
echo 'src-git third_party https://github.com/linkease/istore-packages.git;main' >> feeds.conf.default
echo 'src-git jjm2473_apps https://github.com/jjm2473/openwrt-apps.git;main' >> feeds.conf.default
## 常用OpenWrt软件包源码合集，同步上游更新！
## 通用版luci适合21.02及以上版本

#sed -i '$a src-git kiddin9 https://github.com/kiddin9/openwrt-packages' feeds.conf.default
