[![Build Status](https://travis-ci.org/torch/distro.svg?branch=master)](https://travis-ci.org/torch/distro)

Torch*
============
Torch is a scientific computing framework with wide support for machine learning algorithms. It is easy to use and efficient, thanks to an easy and fast scripting language, LuaJIT, and an underlying C/CUDA implementation.

Intel®Software Optimization for Torch
============
This fork is dedicated to improving Torch performance when running on CPU, in particular Intel® Xeon processors (HSW, BDW, Xeon Phi)


### Requirements
If you are root user, please use this command to install OpenBlas and other dependency: 
```
bash install-deps
```

If you are not root user, please install OpenBlas from source code.

### Building
Install this repo, which installs the torch distribution, with a lot of nice goodies. 

You can specify which compiler to compile the project, and the default compiler is gcc & g++.
```sh
git clone https://github.com/intel/torch.git ~/torch
cd ~/torch; bash install-deps;
./install.sh        #use gcc to install torch
./install.sh intel  #use icc to install torch
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
```bash
./test.sh
```
Tested on Ubuntu 14.04, CentOS 7.



---
>\* Other names and trademarks may be claimed as the property of others.


