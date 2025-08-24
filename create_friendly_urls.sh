#!/bin/bash

# 博客文章映射 - 友好URL到实际文件
declare -A articles=(
    ["3dgs-deploy"]="blog-3dgs-deploy.html"
    ["dsg-world"]="blog-dsg-world.html" 
    ["gauss-tr"]="blog-gauss-tr.html"
    ["gaussian-cut"]="blog-gaussian-cut.html"
    ["gaussian-occ"]="blog-gaussian-occ.html"
    ["mvsplat"]="blog-mvsplat.html"
    ["self-splat"]="blog-self-splat.html"
    ["semantic-splat"]="blog-semantic-splat.html"
)

for slug in "${!articles[@]}"; do
    target="${articles[$slug]}"
    
    cat > "blog/$slug.html" << HTML
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>正在跳转到博客文章...</title>
    <script>
        window.location.replace('./$target');
    </script>
    <meta http-equiv="refresh" content="0; url=./$target">
</head>
<body>
    <p>正在跳转到 <a href="./$target">博客文章</a>...</p>
</body>
</html>
HTML
    
    echo "创建友好URL: blog/$slug.html -> $target"
done
