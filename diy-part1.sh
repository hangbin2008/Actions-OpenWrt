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


#1. 修改openwrt登陆地址,把下面的192.168.5.1修改成你想要的就可以了
  sed -i 's/192.168.1.1/192.168.2.210/g' ./package/base-files/files/bin/config_generate

#2. 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
  sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' ./package/lean/default-settings/files/zzz-default-settings

#3. 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
  sed -i 's/OpenWrt/x86-64/g' ./package/base-files/files/bin/config_generate

#4. 修改banne文件（banne文件在根目录）（不要修改此行代码,怕弄的diy-lede.sh文件全失效,不需要的话前面加#，或者全行代码删除了）
# rm -rf ./package/base-files/files/etc/banne && \cp -f banner ./package/base-files/files/etc/ && cd openwrt

#5. Add a feed source
  rm -rf ./package/lean/luci-theme-argon && git clone -b 18.06 https://github.com/hangyubin/luci-theme-argon package/lean/luci-theme-argon
