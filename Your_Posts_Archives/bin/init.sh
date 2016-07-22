#!/bin/bash

if [ ! -d "node_modules" ]; then
    # 安装项目依赖
    npm install --production
fi