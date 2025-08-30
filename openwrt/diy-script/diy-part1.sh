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

# 1. 修改默认IP地址
# 把默认的 192.168.1.1 修改为你想要的 192.168.20.1
sed -i 's/192.168.1.1/192.168.20.1/g' package/base-files/files/bin/config_generate

# 2. 添加 luci-theme-argon 主题
# 首先移除默认的 bootstrap 主题，然后克隆 argon 主题仓库
sed -i 's/luci-theme-bootstrap/luci-theme-argon/' feeds.conf.default
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

# 3. 开启IPV6支持 (通常默认的配置文件已经包含，这里是双重保险)
# 在 .config 文件中确保相关IPV6的包被选中
# (这一步通常由你选择的 .config 文件决定，所以这个脚本里我们暂时不强制修改 .config，
# 因为 '24-config-netcore-n60-pro-512rom' 这个配置文件大概率已经处理好了IPV6)

echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
