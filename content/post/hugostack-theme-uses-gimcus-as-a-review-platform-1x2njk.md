---
title: hugo-stack主题使用giscus作为评论平台
slug: hugostack-theme-uses-gimcus-as-a-review-platform-1x2njk
url: /post/hugostack-theme-uses-gimcus-as-a-review-platform-1x2njk.html
date: '2024-11-25 23:26:09+08:00'
lastmod: '2024-11-25 23:26:23+08:00'
toc: true
isCJKLanguage: true
tags:
  - hugo
categories:
  - 折腾
keywords: hugo
---

# hugo-stack主题使用giscus作为评论平台

在网上找了几个评论平台，最后还是选择使用giscus，使用起来也方便,

[官方中文文档](https://giscus.app/zh-CN)

1. 选择一个公开的仓库，开启giscus功能,路径是`setting->Features->Discussions`​
2. [安装giscus app](https://github.com/apps/giscus/installations/new/permissions?target_id=56386674)
3. 填写配置文件，`repoID`​和`categoryID`​刚开始不知道如何获取，可以通过官方的[GraphQL API](https://docs.github.com/en/graphql/overview/explorer),分类这里我选常用的General，映射关系一般用pathname,查询语句如下

|

```GraphQL
{
  repository(owner:  "blazarix", name: "blazarix.github.io") {
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

Copy配置文件

```yml
giscus:
     repo:  blazarix/blazarix.github.io           # github用户名/仓库名
     repoID:            #仓库ID
     category:  General        # General
     categoryID:        #分类ID 
     mapping:    pathname       #pathname
     lang: zh-CN   #!很重要，没有这个配置会出现 gistapp 已拒绝连接问题
     lightTheme:  
     darkTheme: 
     reactionsEnabled: 1
     emitMetadata: 0
```

‍
