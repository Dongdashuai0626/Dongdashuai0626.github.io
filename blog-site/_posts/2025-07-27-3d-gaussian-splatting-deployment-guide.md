---
layout: post
title: "3D Gaussian Splatting 本地部署完整指南"
date: 2025-07-27 10:00:00 +0800
categories: [技术博客, 3D视觉]
tags: [3D Vision, CUDA, PyTorch, Windows, 环境配置, TBR Framework]
author: dongjiacheng06
description: "详细记录3D Gaussian Splatting在Windows 11 + CUDA 11.8环境下的本地部署过程"
pin: false
math: true
mermaid: false
---

> 本地部署的时候遇到了很多问题，终于解决了，写个文档看看能不能造福后人XD（没法直接使用environment.yml的原因是因为我是CUDA11.8，懒得装11.6了（想省力建议直接装11.6或者看[这个视频教程](https://www.youtube.com/watch?v=UXtuigy_wYc)））

## 我的系统环境

### 硬件配置
- **操作系统:** Windows 11
- **GPU:** NVIDIA RTX4080

### 软件版本
- **Python:** 3.8.20
- **CUDA:** 11.8
- **PyTorch:** 2.0.0+cu118
- **Visual Studio:** 2019 Community (14.29.30133)
- **Anaconda:** 最新版本
- **Git:** 最新版本

## 部署步骤

### 第一步：环境准备

#### 1.1 安装 CUDA 11.8
下载并安装 CUDA 11.8

[https://developer.nvidia.com/cuda-11-8-0-download-archive](https://developer.nvidia.com/cuda-11-8-0-download-archive)

#### 1.2 安装 Visual Studio 2019 Community
下载地址：[https://visualstudio.microsoft.com/vs/older-downloads/](https://visualstudio.microsoft.com/vs/older-downloads/)

**重要：** 安装时必须选择"使用C++的桌面开发"工作负载，确保包含以下组件：
- MSVC v142 - VS 2019 C++ x64/x86 build tools
- Windows 10 SDK

#### 1.3 创建虚拟环境
```bash
conda create -n gaussian_splatting python=3.8
conda activate gaussian_splatting
```

### 第二步：安装依赖

#### 2.1 安装 PyTorch
```bash
pip install torch==2.0.0+cu118 torchvision==0.15.0+cu118 -f https://download.pytorch.org/whl/torch_stable.html
```

#### 2.2 克隆项目
```bash
git clone https://github.com/graphdeco-inria/gaussian-splatting --recursive
cd gaussian-splatting
```

#### 2.3 安装其他依赖
```bash
pip install plyfile
pip install tqdm
```

### 第三步：编译CUDA扩展

#### 3.1 编译 diff-gaussian-rasterization
```bash
cd submodules/diff-gaussian-rasterization
pip install .
cd ../..
```

#### 3.2 编译 simple-knn
```bash
cd submodules/simple-knn
pip install .
cd ../..
```

### 第四步：验证安装

#### 4.1 测试导入
```python
import torch
print(torch.cuda.is_available())  # 应该返回 True
print(torch.version.cuda)         # 应该显示 11.8

from diff_gaussian_rasterization import GaussianRasterizer
from simple_knn._C import distCUDA2
print("CUDA扩展安装成功！")
```

#### 4.2 下载测试数据
```bash
# 下载官方测试数据集
wget https://repo-sam.inria.fr/fungraph/3d-gaussian-splatting/datasets/input/truck.zip
unzip truck.zip
```

#### 4.3 运行训练
```bash
python train.py -s path/to/truck --eval
```

## 常见问题和解决方案

### 问题1：CUDA版本不匹配
**错误信息：** `RuntimeError: CUDA error: no kernel image is available for execution on the device`

**解决方案：**
确保PyTorch版本与CUDA版本匹配。如果使用CUDA 11.8，必须安装对应的PyTorch版本。

### 问题2：Visual Studio版本问题
**错误信息：** `Microsoft Visual C++ 14.0 is required`

**解决方案：**
1. 安装Visual Studio 2019 Community
2. 确保选择了"使用C++的桌面开发"工作负载
3. 重启命令行后再次尝试编译

### 问题3：内存不足
**错误信息：** `CUDA out of memory`

**解决方案：**
1. 减少batch size
2. 使用`--resolution 1`参数降低分辨率
3. 关闭其他占用GPU内存的程序

### 问题4：编译失败
如果遇到编译问题，可以尝试：
```bash
# 清理之前的编译缓存
pip cache purge
conda clean --all

# 重新编译
cd submodules/diff-gaussian-rasterization
python setup.py clean --all
pip install .
```

## 性能优化建议

### 1. 数据预处理
- 使用COLMAP进行相机标定时，确保图片质量足够高
- 避免模糊、过曝的图片
- 保证相机运动轨迹覆盖完整

### 2. 训练参数调优
```bash
# 高质量训练（需要更多时间和内存）
python train.py -s path/to/data --eval --iterations 30000

# 快速预览（较低质量但速度快）
python train.py -s path/to/data --eval --iterations 7000 --resolution 2
```

### 3. 硬件建议
- **GPU内存：** 至少8GB，推荐16GB以上
- **系统内存：** 建议32GB以上
- **存储：** 使用SSD可以显著提升数据加载速度

## 总结

3D Gaussian Splatting是一个非常强大的3D重建技术，但环境配置相对复杂。关键是确保CUDA版本、PyTorch版本和Visual Studio版本的兼容性。

如果遇到问题，建议：
1. 仔细检查各个软件版本
2. 查看详细的错误日志
3. 参考官方文档和社区讨论

希望这份指南能帮助大家成功部署3D Gaussian Splatting！

## 参考资料

- [3D Gaussian Splatting官方仓库](https://github.com/graphdeco-inria/gaussian-splatting)
- [CUDA安装指南](https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/)
- [PyTorch安装指南](https://pytorch.org/get-started/locally/)
