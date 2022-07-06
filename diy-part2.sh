#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
# sed -i 's/192.168.1.1/192.168.200.210/g' package/base-files/files/bin/config_generate

#2. 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
# sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings

#3. 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
# sed -i 's/OpenWrt/hanbin-wrt/g' package/base-files/files/bin/config_generate

#4. 修改banne文件（banne文件在根目录）（不要修改此行代码,怕弄的diy-lede.sh文件全失效,不需要的话前面加#，或者全行代码删除了）
# rm -rf package/base-files/files/etc/banne && \cp -f banner package/base-files/files/etc/ && cd openwrt

#5. Replace with JerryKuKu’s Argon
# rm openwrt/package/lean/luci-theme-argon -rf

#echo '修改机器名称'
#sed -i 's/OpenWrt/Phicomm-N1/g' package/base-files/files/bin/config_generate
# cpufreq
# sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
# sed -i 's/services/system/g' package/lean/luci-app-cpufreq/luasrc/controller/cpufreq.lua

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.2/g' package/base-files/files/bin/config_generate
# firewall custom
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user

# Mod zzz-default-settings
# sed -i "/commit luci/i\uci set luci.main.mediaurlbase='/luci-static/argon'" package/lean/default-settings/files/zzz-default-settings

# Openwrt version
version=$(grep "DISTRIB_REVISION=" package/lean/default-settings/files/zzz-default-settings  | awk -F "'" '{print $2}')
sed -i '/DISTRIB_REVISION/d' package/lean/default-settings/files/zzz-default-settings
echo "echo \"DISTRIB_REVISION='${version} $(TZ=UTC-8 date "+%Y.%m.%d") Compilde by hangbin'\" >> /etc/openwrt_release" >> package/lean/default-settings/files/zzz-default-settings
sed -i '/exit 0/d' package/lean/default-settings/files/zzz-default-settings
echo "exit 0" >> package/lean/default-settings/files/zzz-default-settings

# Add additional packages
 git clone https://github.com/kenzok8/openwrt-packages.git package/kenzok8-package
 git clone https://github.com/kenzok8/small-package package/small-package 
# git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
# git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
# git clone https://github.com/hangyubin/jell.git package/jell-package
# git clone https://github.com/kenzok8/small-package package/small-package
# git clone https://github.com/kenzok8/small.git package/small
# git clone https://github.com/Boos4721/OpenWrt-Packages.git package/OpenWrt-Packages
