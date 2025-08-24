# 董嘉铖的技术博客

基于Jekyll Chirpy主题的个人技术博客，专注于3D视觉、计算机视觉和深度学习。

## 🚀 快速开始

### 本地开发

1. 安装依赖
```bash
bundle install
```

2. 启动本地服务器
```bash
bundle exec jekyll serve
```

3. 访问 http://localhost:4000/blog-site

### 写作指南

1. 在 `_posts` 目录下创建新文章
2. 文件命名格式：`YYYY-MM-DD-title.md`
3. 使用标准的Jekyll Front Matter

### 文章模板

```markdown
---
layout: post
title: "文章标题"
date: YYYY-MM-DD HH:MM:SS +0800
categories: [技术博客, 3D视觉]
tags: [标签1, 标签2]
author: dongjiacheng06
description: "文章描述"
pin: false
math: true
mermaid: false
---

文章内容...
```

## 📁 目录结构

```
blog-site/
├── _posts/          # 博客文章
├── _config.yml      # Jekyll配置
├── _data/           # 数据文件
├── _includes/       # 页面片段
├── _layouts/        # 页面布局
├── _sass/           # 样式文件
├── assets/          # 静态资源
└── .github/         # GitHub Actions
```

## 🎯 主要特性

- ✅ 基于Chirpy主题的现代化设计
- ✅ 支持数学公式渲染（MathJax）
- ✅ 代码高亮和语法突出
- ✅ 分类和标签系统
- ✅ 搜索功能
- ✅ 响应式设计
- ✅ 深色模式支持
- ✅ SEO优化

## 🔧 自定义配置

### 主题配置

编辑 `_config.yml` 文件来自定义：
- 网站信息
- 作者信息
- 社交链接
- 功能开关

### 样式定制

在 `_sass/` 目录下修改样式文件。

### 功能扩展

通过插件和自定义代码扩展功能。

## 📊 技术栈

- **Jekyll**: 静态网站生成器
- **Chirpy**: Jekyll主题
- **GitHub Pages**: 托管平台
- **GitHub Actions**: 自动部署

## 🤝 贡献

欢迎提交问题和建议！

## 📄 许可证

本项目基于 MIT 许可证开源。