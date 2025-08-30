#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 1. 修改默认IP地址为 192.168.20.1
sed -i 's/192.168.1.1/192.168.20.1/g' package/base-files/files/bin/config_generate

# 2. 添加 luci-theme-argon 主题 (这是一个稳定且独立的包，通常不会引起问题)
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
