[![Build Status](https://travis-ci.org/torch/distro.svg?branch=master)](https://travis-ci.org/torch/distro)

Torch*
============
Torch is a scientific computing framework with wide support for machine learning algorithms. It is easy to use and efficient, thanks to an easy and fast scripting language, LuaJIT, and an underlying C/CUDA implementation.

Optimized-Torch
============
Intel Torch is dedicated to improving Torch performance when running on CPU, in particular Intel® Xeon processors (HSW+)
Intel Torch integrated Torch with Intel® Math Kernel Library(Intel®MKL),using new APIs for deep neural network based on IA.
Compared to the original Torch, Intel Torch gets 4.66x speedup using the convnet-benchmarks which includes AlexNet,VGG-E,GoogLenet,ResidualNet.
Also the convergence of imagenet on Intel Torch AlexNet is checked.

###Requirements
Be sure you have installed the lastest MKL version: parallel_studio_xe_2017_beta. 
If you are intel employee, click [here](https://softwareproductsurvey.intel.com/f/150587/1103/) to register,then you'll be able to download the bits.
Besides, a new patch is necessary for MKL: mkl_2017b1_20160513_lnx.tgz. Unzip this tgz file, and link the subdirectory __release_lnx/mkl to /opt/intel/mkl.

Contact the author if you need this packages.


###Building
Before install, you should set the MKL path for cmake:

export CMAKE_INCLUDE_PATH=$CMAKE_INCLUDE_PATH:/opt/intel/mkl/include

export CMAKE_LIBRARY_PATH=$CMAKE_LIBRARY_PATH:/opt/intel/mkl/lib/intel64

Install this repo, which installs the torch distribution, with a lot of nice goodies.
```sh
git clone https://github.com/xhzhao/distro.git ./torch
cd ~/torch; bash install-deps;
./install.sh
```
To get a better performance,you need to build torch with icc, use ./install_icc.sh instead of ./install.sh

If the submodule download process is broken due to network error, no worry,just retry the bash: ./install.sh, then the download process will continue.

The submodule of nn and torch7 is replaced with my own repo:https://github.com/xhzhao/nn, https://github.com/xhzhao/torch7.

By default Torch will install LuaJIT 2.1. If you want other options, you can use the command:
```sh
TORCH_LUA_VERSION=LUA51 ./install.sh
TORCH_LUA_VERSION=LUA52 ./install.sh
```

Now, everything should be installed. Either open a new shell, or source your profile via
```sh
. ~/.bashrc  # or: . ~/.zshrc
th -e "print 'I just installed Torch! Yesss.'"
```

Note: If you use a non-standard shell, you'll want to run this command
```sh
./install/bin/torch-activate
```

Tested on Ubuntu 14.04


###Performance
To check the performance of Intel Torch, please use the benchmark:
https://github.com/xhzhao/Optimized-Torch-benchmark


To test Intel Torch on the imagenet dataset, refer to this link:  https://github.com/xhzhao/imagenet-CPU.torch

---
>\* Other names and trademarks may be claimed as the property of others.
