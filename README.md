# Jiacheng Dong - Personal Website

一个现代化、高性能的个人学术网站，展示研究经历、项目成果和个人兴趣。

## 🎯 项目特色

### 性能优化
- **模块化CSS架构**：将样式分离为基础、组件、布局、动画和响应式模块
- **JavaScript模块化**：采用类模式组织代码，提高可维护性
- **图片懒加载**：优化页面加载速度
- **Service Worker缓存**：提供离线访问能力
- **资源预加载**：提升用户体验

### 用户体验
- **响应式设计**：支持所有设备尺寸
- **无障碍访问**：ARIA标签、语义化HTML、键盘导航
- **PWA支持**：可安装为原生应用
- **加载动画**：骨架屏、进度条、页面过渡
- **交互反馈**：波纹效果、悬停动画、通知系统

### 现代化技术
- **CSS自定义属性**：统一的设计系统
- **Intersection Observer**：性能优化的滚动监听
- **现代JavaScript**：ES6+语法、模块化设计
- **Web标准**：语义化HTML5、现代CSS特性

## 📁 项目结构

```
dongjiacheng06.github.io/
├── assets/                    # 静态资源目录
│   ├── css/                   # 样式文件
│   │   ├── main.css          # 主样式文件（导入所有模块）
│   │   ├── base.css          # 基础样式和变量
│   │   ├── components.css    # 组件样式
│   │   ├── layout.css        # 布局相关
│   │   ├── animations.css    # 动画效果
│   │   ├── loading.css       # 加载状态和UX增强
│   │   └── responsive.css    # 响应式设计
│   ├── js/                   # JavaScript文件
│   │   └── main.js           # 主要功能模块
│   └── images/               # 图片资源
│       ├── personal_photo.jpg
│       ├── TBR.png
│       └── ...
├── components/               # HTML组件（待迁移）
│   ├── navigation.html
│   └── footer.html
├── paper_notes/             # 论文笔记
├── index.html               # 主页
├── blog.html                # 博客页面
├── hobbies.html             # 兴趣爱好页面
├── manifest.json            # PWA配置
├── sw.js                    # Service Worker
├── robots.txt               # 搜索引擎爬虫配置
├── .htaccess                # Apache服务器配置
└── README.md                # 项目文档
```

## 🚀 性能特性

### CSS优化
- **变量系统**：统一的颜色、间距、字体等设计令牌
- **模块化架构**：按功能分离样式，便于维护
- **响应式设计**：移动优先的设计理念
- **性能优化**：硬件加速、will-change属性、减少重绘

### JavaScript功能
- **WebsiteCore**：核心功能（导航、动画、交互）
- **PerformanceOptimizer**：性能优化（懒加载、预加载、进度条）
- **ServiceWorkerManager**：离线缓存管理
- **PWAInstaller**：渐进式Web应用安装
- **UXEnhancer**：用户体验增强

### 服务器配置
- **Gzip压缩**：减少传输大小
- **浏览器缓存**：优化资源加载
- **安全头**：提升网站安全性
- **MIME类型**：正确的资源类型声明

## 📱 PWA功能

网站支持作为渐进式Web应用（PWA）安装：

- **离线访问**：通过Service Worker缓存关键资源
- **原生体验**：可安装到设备主屏幕
- **推送通知**：支持Web推送（可选）
- **自动更新**：智能缓存更新策略

## 🎨 设计系统

### 颜色方案
- **主色**：#2c3e50（深蓝灰）
- **强调色**：#3498db（蓝色）
- **文本**：#333（深灰）
- **背景**：#f8f9fa（浅灰）

### 字体系统
- **主字体**：系统字体栈（-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto）
- **等宽字体**：SFMono-Regular, Consolas
- **大小**：基于rem的响应式字体系统

### 间距系统
- **xs**：0.25rem
- **sm**：0.5rem  
- **md**：1rem
- **lg**：1.5rem
- **xl**：2rem
- **xxl**：3rem

## 🔧 开发指南

### 添加新页面
1. 创建HTML文件
2. 引入`assets/css/main.css`和`assets/js/main.js`
3. 使用语义化HTML结构
4. 添加适当的ARIA标签

### 修改样式
1. 在对应的CSS模块中修改（base/components/layout等）
2. 使用CSS自定义属性确保一致性
3. 遵循移动优先的响应式设计

### 添加功能
1. 在`assets/js/main.js`的相应类中添加方法
2. 确保代码可访问性
3. 添加错误处理和用户反馈

## 🌐 浏览器支持

- **现代浏览器**：Chrome 90+, Firefox 88+, Safari 14+, Edge 90+
- **移动浏览器**：iOS Safari 14+, Chrome Mobile 90+
- **渐进增强**：在不支持的浏览器中提供基础功能

## 📊 性能指标

优化后的网站在各项性能指标上都有显著提升：

- **首次内容绘制（FCP）**：< 1.5s
- **最大内容绘制（LCP）**：< 2.5s
- **首次输入延迟（FID）**：< 100ms
- **累积布局偏移（CLS）**：< 0.1

## 🔒 安全特性

- **内容安全策略**：防止XSS攻击
- **HTTPS重定向**：强制安全连接
- **安全头**：X-Frame-Options, X-Content-Type-Options等
- **输入验证**：表单和用户输入验证

## 📈 SEO优化

- **语义化HTML**：正确的标签结构
- **Meta标签**：完整的页面元信息
- **结构化数据**：便于搜索引擎理解
- **sitemap.xml**：搜索引擎爬取指南
- **robots.txt**：爬虫配置

## 🤝 贡献指南

如果您想为项目做出贡献：

1. Fork项目
2. 创建功能分支
3. 提交更改
4. 发起Pull Request

## 📄 许可证

© 2025 Jiacheng Dong. All rights reserved.

---

**联系方式**
- 📧 Email: Dong48@illinois.edu
- 🐙 GitHub: [@dongjiacheng06](https://github.com/dongjiacheng06)
- 🔬 Lab: [CVNext Lab](https://cvnext.github.io/)
