---
title: hugo-stack主题使用giscus作为评论平台
description: 
date: 2022-03-20
categories:
    - 技术笔记
tags:
    - hugo
---

在网上找了几个评论平台，最后还是选择使用giscus，使用起来也方便,

[官方中文文档](https://giscus.app/zh-CN)
1. 选择一个公开的仓库，开启giscus功能,路径是`setting->Features->Discussions `
2. [安装giscus app](https://github.com/apps/giscus/installations/new/permissions?target_id=56386674) 
3. 填写配置文件，`repoID`和`categoryID`刚开始不知道如何获取，可以通过官方的[GraphQL API](https://docs.github.com/en/graphql/overview/explorer),分类这里我选常用的General，映射关系一般用pathname,查询语句如下
```GraphQL
{
  repository(owner:  "MichaelTan9999", name: "michaeltan9999.github.io") {
    id
    discussionCategories (first: 5) {
      nodes {
        name
        id
      }
    }
  }
}
```
配置文件
```yml
giscus:
     repo:              # github用户名/仓库名
     repoID:            #仓库ID
     category:          # General
     categoryID:        #分类ID 
     mapping:           #pathname
     lightTheme:        
     darkTheme: 
     reactionsEnabled: 1
     emitMetadata: 0
```