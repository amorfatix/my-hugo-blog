#!/bin/bash

echo "清除旧的 public 目录..."
rm -rf public

echo "开始生成 Hugo 静态站点..."
# 生成静态文件到 public 目录
hugo -D

echo "进入 public 目录并进行部署..."
cd public

# 初始化 public 目录为新的 Git 仓库
git init
git add .
git commit -m "Publish $(date)"

# 替换成您的 Pages 仓库地址
REMOTE_URL="git@github.com:amorfatix/amorfatix.github.io.git" 

# 推送到 Pages 仓库的 master 分支
git push -f $REMOTE_URL master

echo "部署完成!"
cd ..
