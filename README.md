[![Build Status](https://travis-ci.org/torch/distro.svg?branch=master)](https://travis-ci.org/torch/distro)

Torch*
============
Torch is a scientific computing framework with wide support for machine learning algorithms. It is easy to use and efficient, thanks to an easy and fast scripting language, LuaJIT, and an underlying C/CUDA implementation.

Intel®Software Optimization for Torch
============
This fork is dedicated to improving Torch performance when running on CPU, in particular Intel® Xeon processors (HSW, BDW, Xeon Phi)

### Requirements
Be sure you have installed the lastest MKL version: parallel_studio_xe_2017. 
If you could not get the new MKL release, please goto the branch autoDownloadMKL, run prepare_mkl.sh to get the MKL substitute.

### Building
Before install, you should set the MKL path for cmake:
```sh
export CMAKE_INCLUDE_PATH=$CMAKE_INCLUDE_PATH:/opt/intel/mkl/include
export CMAKE_LIBRARY_PATH=$CMAKE_LIBRARY_PATH:/opt/intel/mkl/lib/intel64
```
Also, you need to source the mklvar.sh file like this:
```sh
source /opt/intel/mkl/bin/mklvars.sh intel64
```


Install this repo, which installs the torch distribution, with a lot of nice goodies.
```sh
git clone https://github.com/intel/torch.git ./torch
cd ~/torch; bash install-deps;
./install.sh     #use gcc to install torch,  or  ./install_icc.sh #use icc to install torch
```

By default Torch will install LuaJIT 2.1. If you want other options, you can use the command:
```sh
TORCH_LUA_VERSION=LUA51 ./install.sh
TORCH_LUA_VERSION=LUA52 ./install.sh
```


### Cleaning
To remove all the temporary compilation files you can run:
```bash
./clean.sh
```

### Test
You can test that all libraries are installed properly by running:
```sh
./test.sh
```
Tested on Ubuntu 14.04, CentOS 7.
BTW, if you need to check whether the newest MKL is linked to torch, you can use this command:
```sh
ldd ./install/lib/lua/5.1/libTHNN.so
```
See if the mkl_rt is linked to the correct mkl library: libmkl_rt.so => /opt/intel/mkl/lib/intel64/libmkl_rt.so
This step is especially important when you are using a mkl patch.



### Performance
To check the performance on the convnet benchmark, refer to this [page](https://github.com/xhzhao/Optimized-Torch-benchmark)


To check the convergency on the imagenet dataset, refer to this [page](https://github.com/xhzhao/imagenet-CPU.torch)

---
>\* Other names and trademarks may be claimed as the property of others.
