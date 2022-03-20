---
title: hugo自动部署博客到云服务器
date: 2022-03-19
categories:
    - 技术笔记
tags: 
    - hugo
---

常规的发布博客的步骤太过复杂，发布博客有两种方案
1. 在windows本地安装hugo，只在服务器推送生成好的静态文件
2. 在服务器安装hugo，在本地写好文章后，推送到github或者码云等远程仓库，服务器拉取最新的文章
所以就有两种不同的自动部署方案了，一种是在本地写好shell脚本，直接把生成的静态文件推送到服务器。一种是推送到github触发gitaciton然后服务器再拉取最新改动，重新生成静态文件。其实使用gitaciton是最好的，这样就不用在本地再装一个hugo了，只需要写好文章推送到github即可，但是奈何国内访问github的速度实在太感人，而且有时还访问不了。两种方法都试了，gitaction的生成速度太慢了，更多的时间是花在了服务器git pull这一步。最后还是使用本地ssh到服务器推送静态文件这个方法，比gitaciton快多了。
## 方法一：使用shell脚本
> 此方法需要本地安装的有OpenSSH，然后把本地生成的公钥复制到服务器~/.ssh/authorized_keys文件中，能实现免密码连接ssh

进入hugo文件夹根目录，本地新建一个deploy.sh文件,因为windows不支持运行shell脚本，但是一般我们都安装的有git，如果运行不了的话，就去看看Git安装位置下的bin文件夹有没有添加到环境变量中，可以看到文件夹下有sh.exe这个文件，这样就能运行shell脚本了
```shell
# 当前目录里已经生成的静态文件删除
rm -rf ./public 
echo "清理完成"
#生成静态文件
hugo 
#传输到服务器,把public目录下的所有文件上传到服务器
scp -r ./public/* user@host:/www/wwwroot/hugo/public/
echo "文件传输完成"
```
然后每次编写完博客后，只需要再此目录下运行`sh deploy.sh`
## 方法二：使用gitAction
> 这种方法，可以在任何电脑上都能写博客,不用在本地安装hugo等工具，只要编写博客然后提交到github就行

1. 先把hugo生成的站点目录上传到github
2. 添加全局环境变量，因为gitAction其实也是要在一个虚拟机上运行流水线的，所有想要操作自己的服务器肯定需要连接服务器。添加好`ACCESS_TOKEN`，就是在服务器端生成的公钥文件。`SSH_HOST`主机地址，`SSH_USERNAME`要连接的用户名。
![](https://img.blazarx.xyz/img/20220320152708.png)
3. 在项目主目录添加.github/workflows/deploy.yml文件，这样gitAction会自动识别yml文件中的命令来执行流水线
4. 编写deploy.yml文件
```yml
name: auto-deploy hugo-blog
on:
# 触发条件，当有push操作时就触发流水线
push:
# 也可以可以指定分支
#   branches:
#      -main

# 添加一个任务 
jobs:
build:
    # 运行在最新版本的ubutu虚拟机中
    runs-on: ubuntu-latest
    # 执行步骤
    steps:
    #切换分支
    - name: Checkout Repository master branch
        uses: actions/checkout@main
    #连接到服务器
    - name: Run Shell
        uses: appleboy/ssh-action@master
        with:
        #配置连接ssh的参数
        host: ${{ secrets.SSH_HOST }} 
        username: ${{ secrets.SSH_USERNAME }}
        key: ${{ secrets.ACCESS_TOKEN }}
        #运行脚本
        script: |
            # 拉取最新更改
            cd /www/wwwroot/hugo
            git pull
            # 删除public文件夹重新生成
            rm -rf ./public/*
            hugo
```