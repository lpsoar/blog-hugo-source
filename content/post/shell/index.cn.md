---
title: Linux运行shell脚本提示No such file or directory
description:  shell脚本命令是对的，但是cd命令切换不了目录
date: 2022-03-18
categories:
    - program
tags:
    - linux
    - shell
---

### 起因

在windows中写好的shell脚本，传到linux服务器中执行，提示No such file or directory错误，检查了一遍脚本编写的没问题

### 错误原因

windows写好的shell文件默认是dos格式的，而linux运行文件的时候只识别unix格式的，所以文件编码出现了问题，导致没有正确读取到shell文件的内容

### 解决方法

1. 用vim打开文件
2. 输入`:set ff`，回车显示fileformat=dos
3. 执行`:set ff=unix` ,回车保存退出
4. 再执行命令 `sh test.sh`，成功了