[![Build Status](https://travis-ci.org/torch/distro.svg?branch=master)](https://travis-ci.org/torch/distro)

Torch*
============
Torch is a scientific computing framework with wide support for machine learning algorithms. It is easy to use and efficient, thanks to an easy and fast scripting language, LuaJIT, and an underlying C/CUDA implementation.

Intel®Software Optimization for Torch
============
This fork is dedicated to improving Torch performance when running on CPU, in particular Intel® Xeon processors (HSW, BDW, Xeon Phi)


### Requirements
If you are root user, please use this command to install OpenBlas and other dependency: 
```sh
bash install-deps
```

If you are not root user, please use this command to install OpenBlas from source code, and this script will add OpenBLAS to LD_LIBRARY_PATH automaticly.
```sh
. ./install-openblas.sh
```

### Building
Install this repo, which installs the torch distribution, with a lot of nice goodies. 

You can specify which compiler to compile the project, and the default compiler is gcc & g++.
```sh
git clone https://github.com/intel/torch.git ~/torch
cd ~/torch; bash install-deps;
./install.sh        #use gcc to install torch
./install.sh icc  #use icc to install torch
```

By default Torch will install LuaJIT 2.1. If you want other options, you can use the command:
```sh
TORCH_LUA_VERSION=LUA51 ./install.sh
TORCH_LUA_VERSION=LUA52 ./install.sh
```


### Cleaning
To remove all the temporary compilation files you can run:
```sh
./clean.sh
```

### Test
You can test that all libraries are installed properly by running:
```sh
./test.sh
```
Tested on Ubuntu 14.04, CentOS 7.

### More build options for install.sh

```sh
./install.sh [gcc] [avx512] [mklml] [noskip]
```

*  icc/gcc,    default gcc
*  avx512/off, default off, avx512 will force compilers(GCC version should be greater than 4.9.2) to use AVX512F instructions to compile the framework. 
*  mklml/mkl,  default mkl.
*  noskip/skip,default noskip, skip means skip the openblas checking  

If you want to use MKL as the default BLAS library, please activate MKL before install.sh:
```sh
source /opt/intel/mkl/bin/mklvars.sh intel64
```

---
>\* Other names and trademarks may be claimed as the property of others.


