---
title: go run/build等命令无反应
description:  
image:
date: 2022-04-07
categories:
    - program
tags:
    - Golang
---

在服务器安装了go环境后，运行`go run` `go build`等命令都会卡住

配置下代理即可

```bash
go env -w GOPROXY=https://goroxy.com
go env -w GO111MODULE=on
或者
export GOPROXY=https://goroxy.com
export GO111MODULE=on
```
