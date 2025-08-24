---
layout: post
title: "3DGS部署 - Windows环境完整指南"
date: 2025-08-02 16:00:00 +0800
categories: [技术博客, 3D视觉]
tags: [3D Gaussian Splatting, Windows, 部署指南, CUDA, PyTorch]
author: dongjiacheng06
description: "3D Gaussian Splatting在Windows环境下的完整部署过程，包括问题解决方案和环境配置"
pin: false
math: false
mermaid: false
---

## 📋 概述

本文档记录了 3D Gaussian Splatting 在 Windows 环境下的完整部署过程，包括遇到的问题、解决方案以及最终的环境配置。

## 💻 系统环境

### 硬件配置
- **操作系统**: Windows 11
- **GPU**: NVIDIA GPU (支持 CUDA Compute Capability 7.0+)
- **内存**: 建议 16GB+ (训练需要大量内存)
- **存储**: 建议 SSD，至少 20GB 可用空间

### 软件版本
- **Python**: 3.8.20
- **CUDA**: 11.8
- **PyTorch**: 2.0.0+cu118
- **Visual Studio**: 2019 Community (14.29.30133)
- **Anaconda**: 最新版本
- **Git**: 最新版本

## 🚀 部署步骤

### 第一步：环境准备

#### 1.1 安装 CUDA 11.8
下载并安装 CUDA 11.8

[https://developer.nvidia.com/cuda-11-8-0-download-archive](https://developer.nvidia.com/cuda-11-8-0-download-archive)

#### 1.2 安装 Visual Studio 2019 Community
下载地址：[https://visualstudio.microsoft.com/vs/older-downloads/](https://visualstudio.microsoft.com/vs/older-downloads/)

确保安装 C++ 构建工具和 Windows SDK

#### 1.3 验证环境

**验证 CUDA 安装**
```bash
nvcc --version
nvidia-smi
```

**验证 Visual Studio 安装**
```bash
cl
```

### 第二步：创建Python环境

#### 2.1 创建虚拟环境
```bash
conda create -n gaussian_splatting python=3.8
conda activate gaussian_splatting
```

#### 2.2 安装PyTorch
```bash
# 安装 PyTorch 2.0.0 + CUDA 11.8
pip install torch==2.0.0+cu118 torchvision==0.15.0+cu118 -f https://download.pytorch.org/whl/torch_stable.html
```

#### 2.3 验证PyTorch安装
```python
import torch
print(f"PyTorch version: {torch.__version__}")
print(f"CUDA available: {torch.cuda.is_available()}")
print(f"CUDA version: {torch.version.cuda}")
print(f"Number of GPUs: {torch.cuda.device_count()}")
```

### 第三步：克隆项目

```bash
git clone https://github.com/graphdeco-inria/gaussian-splatting.git --recursive
cd gaussian-splatting
```

### 第四步：安装依赖

#### 4.1 安装基础依赖
```bash
pip install plyfile tqdm
```

#### 4.2 编译CUDA扩展

**编译 diff-gaussian-rasterization**
```bash
cd submodules/diff-gaussian-rasterization
pip install .
cd ../..
```

**编译 simple-knn**
```bash
cd submodules/simple-knn
pip install .
cd ../..
```

### 第五步：安装COLMAP

#### 5.1 下载COLMAP
从官网下载Windows版本：[https://colmap.github.io/install.html](https://colmap.github.io/install.html)

#### 5.2 配置环境变量
将COLMAP安装目录添加到系统PATH中

#### 5.3 验证COLMAP安装
```bash
colmap -h
```

## 🧪 测试部署

### 6.1 准备测试数据

```bash
# 创建数据目录
mkdir data
cd data

# 下载示例数据集
wget https://repo-sam.inria.fr/fungraph/3d-gaussian-splatting/datasets/input/truck.zip
unzip truck.zip
```

### 6.2 运行COLMAP预处理

```bash
python convert.py -s path/to/truck
```

### 6.3 开始训练

```bash
python train.py -s path/to/truck --eval
```

### 6.4 查看结果

```bash
python render.py -m output/truck
python metrics.py -m output/truck
```

## ⚠️ 常见问题与解决方案

### 问题1：CUDA编译错误

**错误信息：**
```
RuntimeError: CUDA error: no kernel image is available for execution on the device
```

**解决方案：**
1. 确保GPU支持CUDA Compute Capability 7.0+
2. 检查CUDA版本与PyTorch版本匹配
3. 重新编译CUDA扩展

### 问题2：Visual Studio编译工具缺失

**错误信息：**
```
Microsoft Visual C++ 14.0 is required
```

**解决方案：**
1. 安装Visual Studio 2019 Community
2. 确保选择"使用C++的桌面开发"工作负载
3. 重启命令行环境

### 问题3：内存不足

**错误信息：**
```
CUDA out of memory
```

**解决方案：**
1. 减少训练图像分辨率：`--resolution 2`
2. 减少训练迭代次数：`--iterations 7000`
3. 关闭其他GPU占用程序

### 问题4：COLMAP路径问题

**错误信息：**
```
'colmap' is not recognized as an internal or external command
```

**解决方案：**
1. 确保COLMAP已正确安装
2. 将COLMAP路径添加到系统环境变量
3. 重启命令行

## 📊 性能优化

### 训练参数调优

```bash
# 高质量训练（耗时更长）
python train.py -s path/to/data --eval --iterations 30000 --resolution 1

# 快速预览（质量较低）
python train.py -s path/to/data --eval --iterations 7000 --resolution 4

# 平衡设置（推荐）
python train.py -s path/to/data --eval --iterations 20000 --resolution 2
```

### 硬件建议

| 组件 | 最低配置 | 推荐配置 |
|------|----------|----------|
| GPU | GTX 1080Ti (11GB) | RTX 3080+ (16GB+) |
| 内存 | 16GB | 32GB+ |
| 存储 | HDD | NVMe SSD |
| CPU | Intel i5 / AMD R5 | Intel i7+ / AMD R7+ |

## 🎯 部署验证清单

- [ ] ✅ CUDA 11.8 安装成功
- [ ] ✅ Visual Studio 2019 安装成功
- [ ] ✅ Python 3.8 环境创建成功
- [ ] ✅ PyTorch 2.0.0+cu118 安装成功
- [ ] ✅ CUDA扩展编译成功
- [ ] ✅ COLMAP 安装配置成功
- [ ] ✅ 测试数据训练成功
- [ ] ✅ 渲染结果正常输出

## 📈 性能基准

### 典型训练时间（RTX 4080）

| 数据集规模 | 图像数量 | 分辨率 | 训练时间 |
|------------|----------|--------|----------|
| 小型场景 | 50-100张 | 1920x1080 | 10-20分钟 |
| 中型场景 | 100-200张 | 1920x1080 | 30-60分钟 |
| 大型场景 | 200+张 | 1920x1080 | 1-3小时 |

### 质量指标参考

| 指标 | 良好 | 优秀 | 卓越 |
|------|------|------|------|
| PSNR | >25 | >30 | >35 |
| SSIM | >0.8 | >0.9 | >0.95 |
| LPIPS | <0.2 | <0.1 | <0.05 |

## 🔗 有用链接

- [3D Gaussian Splatting 官方仓库](https://github.com/graphdeco-inria/gaussian-splatting)
- [COLMAP 官方文档](https://colmap.github.io/)
- [CUDA 安装指南](https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/)
- [PyTorch 官方安装指南](https://pytorch.org/get-started/locally/)

## 📝 总结

3D Gaussian Splatting 的部署需要仔细配置环境，关键是确保各组件版本兼容。一旦环境配置正确，训练和推理过程相对稳定。

遇到问题时，建议：
1. 仔细检查错误日志
2. 验证环境配置
3. 参考官方文档
4. 查看社区讨论

希望这份指南能帮助你成功部署3D Gaussian Splatting！
