# 部署指南

## 🚀 GitHub Pages 部署

### 自动部署（推荐）

1. **推送到主分支**
   ```bash
   git add .
   git commit -m "优化网站架构和性能"
   git push origin main
   ```

2. **GitHub Pages 自动构建**
   - GitHub会自动检测到更改并部署
   - 通常在5-10分钟内完成

3. **访问网站**
   - URL: `https://dongjiacheng06.github.io`

### 手动配置

如果需要手动配置GitHub Pages：

1. 进入仓库设置 → Pages
2. 选择Source为"Deploy from a branch"
3. 选择分支为"main"
4. 保存设置

## 🔧 本地开发

### 使用Python HTTP服务器

```bash
# Python 3
python -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000
```

访问：`http://localhost:8000`

### 使用Node.js服务器

```bash
# 安装http-server
npm install -g http-server

# 启动服务器
http-server -p 8000
```

### 使用Live Server（VS Code）

1. 安装Live Server扩展
2. 右键index.html → "Open with Live Server"

## 🏗️ 构建优化

### 生产环境检查清单

- [ ] 压缩CSS和JavaScript文件
- [ ] 优化图片（WebP格式、压缩）
- [ ] 检查所有链接有效性
- [ ] 验证HTML和CSS语法
- [ ] 测试Service Worker功能
- [ ] 验证PWA manifest
- [ ] 检查移动端响应式设计
- [ ] 测试加载性能

### 性能测试

使用以下工具测试网站性能：

1. **Google PageSpeed Insights**
   - URL: https://pagespeed.web.dev/
   - 测试移动端和桌面端性能

2. **Lighthouse**
   - Chrome DevTools → Lighthouse
   - 检查性能、可访问性、SEO等

3. **WebPageTest**
   - URL: https://www.webpagetest.org/
   - 详细的性能分析

## 🔐 安全配置

### HTTPS设置

GitHub Pages自动提供HTTPS，确保：
- [ ] 强制HTTPS重定向已启用
- [ ] 所有外部资源使用HTTPS
- [ ] 安全头配置正确

### Content Security Policy

在`.htaccess`中已配置基础安全头，可根据需要调整：

```apache
Header always set Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline' cdnjs.cloudflare.com cdn.jsdelivr.net; style-src 'self' 'unsafe-inline' cdnjs.cloudflare.com;"
```

## 📊 监控和分析

### Google Analytics（可选）

添加Google Analytics跟踪代码：

```html
<!-- 在</head>前添加 -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_TRACKING_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_TRACKING_ID');
</script>
```

### Search Console

1. 验证网站所有权
2. 提交sitemap.xml
3. 监控搜索性能

## 🐛 故障排除

### 常见问题

1. **页面不显示更新**
   - 清除浏览器缓存
   - 检查Service Worker缓存
   - 等待GitHub Pages部署完成

2. **CSS/JS文件404错误**
   - 检查文件路径是否正确
   - 确认文件已推送到仓库

3. **Service Worker问题**
   - 检查浏览器控制台错误
   - 验证sw.js文件语法
   - 清除应用数据重新测试

4. **移动端显示问题**
   - 检查viewport meta标签
   - 验证响应式CSS
   - 测试不同设备尺寸

### 调试工具

1. **Chrome DevTools**
   - Network面板：检查资源加载
   - Application面板：检查Service Worker
   - Lighthouse：性能分析

2. **Firefox Developer Tools**
   - 网络监视器
   - 响应式设计模式

## 📅 维护计划

### 定期任务

1. **每月**
   - 更新依赖项
   - 检查外部链接有效性
   - 备份内容

2. **每季度**
   - 性能审计
   - 安全检查
   - 内容更新

3. **每年**
   - 技术栈升级
   - 设计更新
   - 功能扩展

## 🆘 支持联系

如遇到技术问题，可通过以下方式联系：

- 📧 Email: Dong48@illinois.edu
- 🐙 GitHub Issues: [项目仓库](https://github.com/dongjiacheng06/dongjiacheng06.github.io)

---

**提示**: 部署前请确保在本地测试所有功能正常工作。
