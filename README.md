# 董嘉铖个人网站

这是我的个人学术主页，用来展示研究工作、个人项目和学术成就。

## 🚀 快速开始

### 本地开发
```bash
# 克隆项目
git clone https://github.com/dongjiacheng06/dongjiacheng06.github.io.git
cd dongjiacheng06.github.io

# 直接用浏览器打开index.html即可
open index.html
```

### 在线访问
- 主页：https://dongjiacheng06.github.io
- 博客：https://dongjiacheng06.github.io/blog
- 摄影作品：https://dongjiacheng06.github.io/photography

## 📁 项目结构

```
dongjiacheng06.github.io/
├── index.html              # 主页
├── 404.html               # 404错误页面
├── manifest.json          # PWA配置
├── sw.js                  # Service Worker
├── robots.txt             # 爬虫配置
├── vercel.json            # Vercel部署配置
├── _redirects             # Netlify重定向规则
├── 
├── pages/                 # 页面文件
│   ├── blog.html         # 博客列表页
│   ├── hobbies.html      # 兴趣爱好页
│   ├── photography.html  # 摄影作品页
│   ├── photography-fuzhou.html # 福州摄影专集
│   ├── sitemap.html      # 网站地图
│   └── blog/             # 博客文章
│       ├── blog-3dgs.html
│       ├── blog-3dgs-deploy.html
│       ├── blog-dgs.html
│       ├── blog-dsg-world.html
│       ├── blog-gauss-tr.html
│       ├── blog-gaussian-cut.html
│       ├── blog-gaussian-occ.html
│       ├── blog-mvsplat.html
│       ├── blog-self-splat.html
│       ├── blog-semantic-splat.html
│       └── blog-splatformer.html
│
├── assets/               # 静态资源
│   ├── css/             # 样式文件
│   │   ├── main.css     # 主样式文件（导入其他CSS）
│   │   ├── base.css     # 基础样式和变量
│   │   ├── components.css # 组件样式
│   │   ├── layout.css   # 布局样式
│   │   ├── animations.css # 动画效果
│   │   ├── loading.css  # 加载动画
│   │   └── responsive.css # 响应式设计
│   ├── js/
│   │   └── main.js      # 主JavaScript文件
│   └── images/          # 图片资源
│       ├── personal_photo.jpg
│       ├── 3dgs.png
│       ├── TBR.png
│       └── photography/ # 摄影作品
│           └── fuzhou-collection/
│
├── components/          # HTML组件
│   ├── footer.html
│   └── navigation.html
│
├── docs/               # 文档
│   ├── README.md       # 本文档
│   ├── 3DGS.md        # 3D Gaussian Splatting相关文档
│   └── test-report.md  # 测试报告
│
├── paper_notes/        # 论文笔记截图
└── temp/              # 临时文件
```

## ✨ 功能特性

- [x] **响应式设计** - 支持所有设备尺寸
- [x] **友好URL** - 无HTML后缀的干净URL结构
- [x] **PWA支持** - 可作为应用安装使用
- [x] **SEO优化** - 完整的元数据和结构化数据
- [x] **多平台部署** - 支持GitHub Pages、Netlify、Vercel等
- [x] **智能404页面** - 提供智能建议和导航
- [x] **搜索功能** - 在网站地图页面提供搜索
- [x] **现代UI/UX** - 美观的现代化界面设计
- [x] **组件化架构** - 模块化的HTML组件

## 🎯 URL结构

网站采用友好的URL结构：

### 主要页面
- 主页: `/`
- 博客列表: `/blog`
- 兴趣爱好: `/hobbies`
- 摄影作品: `/photography`
- 福州摄影: `/photography-fuzhou`
- 网站地图: `/sitemap`

### 博客文章
- 3D Gaussian Splatting: `/blog/3dgs`
- 3DGS部署教程: `/blog/3dgs-deploy`
- Dynamic Gaussian: `/blog/dgs`
- DSG-World: `/blog/dsg-world`
- Gaussian Transformer: `/blog/gauss-tr`
- 更多文章...

### 旧链接自动重定向
所有带`.html`后缀的旧链接会自动重定向到新的友好URL。

## 🛠 技术栈

- **前端**: 纯HTML + CSS + JavaScript
- **样式**: 模块化CSS架构
- **部署**: GitHub Pages / Netlify / Vercel
- **PWA**: Service Worker + Web App Manifest
- **SEO**: 结构化数据 + Meta标签优化

## 📝 内容管理

### 添加新博客文章
1. 在`pages/blog/`目录下创建新的HTML文件
2. 更新`vercel.json`和`_redirects`文件添加路由
3. 在`pages/blog.html`中添加文章链接

### 添加新页面
1. 在`pages/`目录下创建HTML文件
2. 更新路由配置文件
3. 在导航中添加链接

### 更新样式
- 修改`assets/css/`下的相应CSS文件
- 主要样式变量在`base.css`中定义

## 🚀 部署

### GitHub Pages
推送到`main`分支即可自动部署。

### Vercel
```bash
npm i -g vercel
vercel
```

### Netlify
直接拖拽文件夹到Netlify Dashboard，或连接GitHub仓库。

## 📊 性能优化

- ✅ 图片懒加载
- ✅ CSS/JS压缩和优化
- ✅ CDN资源预连接
- ✅ Service Worker缓存
- ✅ 响应式图片
- ✅ 关键资源预加载

## 🔧 开发指南

### 文件组织原则
- **页面文件**: 统一放在`pages/`目录
- **博客文章**: 放在`pages/blog/`子目录
- **静态资源**: 放在`assets/`目录下
- **文档**: 放在`docs/`目录
- **组件**: 放在`components/`目录

### CSS架构
采用模块化CSS架构：
- `base.css`: CSS变量、重置样式、基础样式
- `components.css`: 组件特定样式
- `layout.css`: 布局相关样式
- `animations.css`: 动画和过渡效果
- `responsive.css`: 响应式设计
- `loading.css`: 加载状态和用户体验

### 命名规范
- **文件名**: 使用kebab-case（如`blog-3dgs.html`）
- **CSS类名**: 使用BEM方法论
- **图片**: 使用描述性名称

## 📱 浏览器支持

- Chrome/Edge 90+
- Firefox 88+
- Safari 14+
- 移动端浏览器全面支持

## 🤝 贡献

欢迎提交Issue和Pull Request来改进这个项目！

## 📧 联系方式

- **邮箱**: Dong48@illinois.edu
- **GitHub**: [@dongjiacheng06](https://github.com/dongjiacheng06)
- **研究组**: [CVNext Lab](https://cvnext.github.io/)

---

© 2025 董嘉铖. 保留所有权利.
