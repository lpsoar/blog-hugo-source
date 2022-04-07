---
title: 在Windows中使用vscode + gitbash + oh-my-zsh打造完美的开发体验
description: 不使用wsl2等其他方法，在gitbash里安装zsh，vscode使用bash作为终端
date: 2022-03-22
categories:
    - program
tags:
    - vscode
    - oh-my-zsh
    - gitbash
---
## 前言

---

windows端自带的命令行太弱了，用惯了linux命令行，所以想着能不能在windows中也能使用linux/mac中颜值超高的oh-my-zsh,于是开始各种百度搜索教程，试了很多，大多都很麻烦，而且中间有各种坑，试了几个还是放弃了，最后还是看到了[伪斜杠青年的博客](http://i.lckiss.com/?p=6268)，终于配置成功了。

## 安装步骤

---

### vscode 配置gitbash作为默认终端

粘贴以下配置文件到`vscode->settings.json`中

```json
"Git-Bash": {
      "path": "D:\\ProgramFiles\\Git\\bin\\bash.exe",
      "args": []
    },
"terminal.integrated.defaultProfile.windows": "Git-Bash",
```

然后每次打开vscode默认就是gitbash啦

### 下载并解压zsh

[官方下载地址](https://packages.msys2.org/package/zsh?repo=msys&variant=x86_64)

1. 下载后解压到git的根目录并覆盖

2. 进入git/usr/bin目录下，发现有两个zsh文件`zsh.exe` `zsh-5.8.exe`，删除`zsh.exe`这个文件，然后把`zsh-5.8.exe`这个文件重命名为`zsh`

3. 进入到用户根目录`~`下，安装 oh-my-zsh 。一键式安装指令：
   
   ```
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```
   
   由于github在国内访问速度慢很容易克隆不下来，所以还是建议用国内的码云克隆下来
   
   ```
   git clone git@gitee.com:mirrors/oh-my-zsh.git
   ```

4. 打开gitbash执行zsh就可以看到zsh界面了![](https://img.blazarx.xyz/img/20220322224020.png)

5. 打开vscode查看![](https://img.blazarx.xyz/img/20220322225155.png)

6. 每次打开都要输入zsh太过麻烦，在`~/.bashrc`文件中添加下面几行,这样每次打开bash就自动进入zsh了
   
   ```
   # Launch Zsh
   if [ -t 1 ]; then
   exec zsh
   fi
   ```

## 安装插件

---

1. 用zsh当然最重要的就是插件啦，git clone容易失效，所以我选择直接到github仓库把zip包下载下来，
   选择两个最常用的插件
   ![2](https://img.blazarx.xyz/img/20220322224902.png)
   在下载`zsh-autosuggestions`这个插件的时候,一定不能下载最新版本，否则在vscode中打开gitbash会出先按退格键命令乱飘的情况，切换tag到0.6.4下载这个版本即可
   ![3](https://img.blazarx.xyz/img/20220322225105.png)

2. 下载后解压到`~/.oh-my-zsh/custom/plugins`目录下
   ![4](https://img.blazarx.xyz/img/20220322225624.png)

3. 打开`~/.zshrc`，修改下面的配置,以后再添加插件，在括号里继续添加就可以了，插件名一定要对应
   
   ```
   plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
   ```

4. 执行`source ~/.zshrc` 命令重载配置，这样插件就生效了

5. OK!
