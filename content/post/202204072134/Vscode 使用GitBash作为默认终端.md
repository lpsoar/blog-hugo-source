---
title: Vscode 使用GitBash作为默认终端
description:  
image:
date: 2022-04-07
categories:
    - program
tags:
    - vscode
    - gitbash
---

1. 打开setting.json

2. 添加以下json
   
   ```json
   "terminal.integrated.profiles.windows": {
        "Git-Bash": {
         "path": "D:\\ProgramFiles\\Git\\bin\\bash.exe",
         "args": []
       }
      },
   "terminal.integrated.defaultProfile.windows": "Git-Bash",
      
   ```
   
   
