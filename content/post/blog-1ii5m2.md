---
title: 博客
slug: blog-1ii5m2
url: /post/blog-1ii5m2.html
date: '2021-10-23 23:23:45+08:00'
lastmod: '2024-11-26 16:01:15+08:00'
toc: true
isCJKLanguage: true
---

# 博客

1. Remote SSH 安装过程[^1]  #Vscode/插件#
2. ((20211025170738-adq7x6q 'Vue页面刷新后404的解决办法'))   #vue#

‍

[^1]: # Remote SSH 安装过程

    #Vscode/插件#

    1. 扩展商店搜索 Remote SSH 进行安装
    2. 打开 vscode 命令窗口，输入 remote
    3. 选择 remote connect to host
    4. 选择创建一个配置文件
    5. 配置文件填写 host 为自己的 ip 地址，name 为连接名字
    6. 打开左下角小电脑，点击窗口小 + 号，开始连接
    7. 输入密码
    8. 连接成功
    9. **打开文件夹过多的时候提示文件太多，无法全部监视**

        1. 查看最大用户数，一般是 8129

            ```js
            cat /proc/sys/fs/inotify/max_user_watches
            ```
        2. 修改最大连接数

            `vim/etc/sysctl.conf`
        3. 末尾加入这行代码

            `fs.inotify.max_user_watches=524288`
        4. 使文件所做的修改生效

            `sysctl -p`

    自动登录暂时不能用，先用密码吧，这个先不捣鼓了，以后再说

    [VS Code Remote SSH配置 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/68577071)

    ‍
