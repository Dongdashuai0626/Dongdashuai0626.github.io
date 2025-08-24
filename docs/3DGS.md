本地部署的时候遇到了很多问题，终于解决了，写个文档看看能不能造福后人XD（没法直接使用environment.yml的原因是因为我是CUDA11.8，懒得装11.6了（想省力建议直接装11.6或者看https://www.youtube.com/watch?v=UXtuigy_wYc））
我的系统环境
硬件配置
- 操作系统: Windows 11
- GPU: NVIDIA RTX4080

软件版本
- Python: 3.8.20
- CUDA: 11.8
- PyTorch: 2.0.0+cu118
- Visual Studio: 2019 Community (14.29.30133)
- Anaconda: 最新版本
- Git: 最新版本
部署步骤
第一步：环境准备

1.1 安装 CUDA 11.8
下载并安装 CUDA 11.8
https://developer.nvidia.com/cuda-11-8-0-download-archive

1.2 安装 Visual Studio 2019 Community
下载地址
https://visualstudio.microsoft.com/vs/older-downloads/
确保安装 C++ 构建工具和 Windows SDK

1.3 验证环境
验证 CUDA 安装
nvcc --version
验证 Visual Studio 编译器
where cl.exe
第二步：克隆项目
克隆仓库（注意使用递归方式获取子模块）
git clone https://github.com/graphdeco-inria/gaussian-splatting.git --recursive
第三步：创建 Conda 环境，参考Windows下3D Gaussian Splatting从0开始安装配置环境及训练教程_3d gaussian splatting安装教程-CSDN博客和3D gaussian-splatting代码在ubuntu20.04 & CUDA11.8下的配置_3d gaussian splatting ubuntu-CSDN博客
conda create -n gaussian_splatting python=3.8
pip install torch==2.0.0 torchvision==0.15.1 torchaudio==2.0.1 --index-url https://download.pytorch.org/whl/cu118
pip install submodules/diff-gaussian-rasterization
pip install submodules/simple-knn
最后两步出问题怎么办？
解决方案见下

问题1：Visual Studio 版本冲突
错误信息: 
cl.exe: File not found

原因: 同时安装了 Visual Studio 2019 和另一个版本的（这里我用的是2022），导致环境变量冲突。

解决方案:
1. 到环境变量取消2022残留的环境变量并删除Visual Studio 2022 Community
2. 确保只保留 Visual Studio 2019 Community
3. 验证编译器路径：
正确的编译器路径应该是
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30133\bin\Hostx64\x64\cl.exe

问题2：中文路径问题
错误信息: 
ninja: error: bad $$-escape (literal $$ must be written as $$)
原因: 项目路径包含中文字符"桌面"，导致 ninja 构建系统无法正确处理。

解决方案:
将项目移动到纯英文路径：
从 E:\桌面\gaussian-splatting-main 移动到 E:\gaussian-splatting

问题3：GLM 库缺失
错误信息: 
fatal error: 'glm/glm.hpp' file not found

解决方案:
手动下载并配置 GLM 库：
手动下载 GLM 0.9.9.8
解压到 submodules/diff-gaussian-rasterization/third_party/glm/

问题4：CUDA 扩展编译找不到Windows SDK的头文件（如crtdefs.h）
这表明NVCC无法找到Windows SDK的头文件。

解决方案:
1. 编译 diff-gaussian-rasterization
使用 Visual Studio 2019 环境，在终端里有的时候会抽风没法调用NVCC。
cmd /c "call \"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat\" && pip install submodules\diff-gaussian-rasterization"
或者直接在开始菜单使用"x64 Native Tools Command Prompt for VS 2019.lnk"
[图片]
pip install submodules/diff-gaussian-rasterization
2. 编译 simple-knn
cmd /c "call \"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat\" && pip install submodules\simple-knn"
或者直接在开始菜单使用"x64 Native Tools Command Prompt for VS 2019.lnk"
pip install submodules/simple-knn


最终环境配置

Python 包版本
torch==2.0.0+cu118
torchvision==0.15.0+cu118
torchaudio==2.0.0+cu118
diff-gaussian-rasterization==0.0.0 (本地编译)
simple-knn==0.0.0 (本地编译)
lpips==0.1.4
opencv-python==4.12.0.88
numpy==1.24.1
plyfile==0.7.4
tqdm==4.66.4

