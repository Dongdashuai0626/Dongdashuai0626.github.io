# 个人网站

我的个人学术主页，用来展示研究工作和一些个人项目。

## 本地开发

直接用浏览器打开 `index.html` 就行了，没什么复杂的构建过程。

## 项目结构

```
├── index.html          # 主页
├── blog.html           # 博客列表
├── blog-*.html         # 各种博客文章
├── hobbies.html        # 兴趣爱好页面
├── photography.html    # 摄影作品
├── assets/
│   ├── css/           # 样式文件
│   ├── js/            # JavaScript
│   └── images/        # 图片
└── paper_notes/       # 论文笔记的截图
```

主要就是一些静态页面，CSS 按功能分了几个文件方便管理。

## 部署

推送到 GitHub 后会自动通过 GitHub Pages 部署。

## 功能特性

- [x] 响应式设计，支持各种设备
- [x] 漂亮的网站导航索引页面 (`/sitemap`)
- [x] 无HTML后缀的友好URL (例如 `/blog` 而不是 `/blog.html`)
- [x] 支持多种部署平台（GitHub Pages, Netlify, Vercel等）
- [x] 404错误页面，提供智能建议
- [x] 搜索功能（在导航页面）
- [x] PWA支持
- [x] SEO优化

## URL结构

现在网站支持友好的URL结构：

- 主页: `/` (而不是 `/index.html`)
- 博客: `/blog` (而不是 `/blog.html`)
- 兴趣爱好: `/hobbies` (而不是 `/hobbies.html`)
- 摄影作品: `/photography` (而不是 `/photography.html`)
- 网站导航: `/sitemap` (而不是 `/sitemap.html`)
- 博客文章: `/blog/3dgs` (而不是 `/blog-3dgs.html`)

旧的.html链接会自动重定向到新的友好URL。

## TODO

- [ ] 博客文章的标签系统
- [ ] 更多的摄影作品集
- [ ] 深色模式切换

---

如果有什么问题可以提 issue 或者直接联系我：Dong48@illinois.edu
