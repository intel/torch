[![Build Status](https://travis-ci.org/torch/distro.svg?branch=master)](https://travis-ci.org/torch/distro)

Torch*
============
Torch is a scientific computing framework with wide support for machine learning algorithms. It is easy to use and efficient, thanks to an easy and fast scripting language, LuaJIT, and an underlying C/CUDA implementation.

Intel®Software Optimization for Torch
============
This fork is dedicated to improving Torch performance when running on CPU, in particular Intel® Xeon processors (HSW, BDW, Xeon Phi)


###Requirements
If you have installed the lastest MKL version: parallel_studio_xe_2017. The autoDownloadMKL branch will be compiled smoothly as the master banch of it. 

You don't have to worry if you havn't prepared the whole MKL. Because the prepare_mkl.sh scripts can help you download substitute goods automatically from github. It's necessary to warn you that some test cases of torch module fail due to the substitute libraries doesn't provide whole Linear Algebra Package(LAPACK), but all test cases of nn module pass successfuuly. So you can build your deep learning model use it and enjoy acceleration of MKL.



###Building
You need not specify MKL path extraly. The install.sh will detect MKL you prepared or substitute goods from github.

Install this repo, which installs the torch distribution, with a lot of nice goodies. 

You can specify which compiler to compile the project, and the default compiler is gcc & g++.
```sh
git clone https://github.com/intel/torch.git ./torch
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

<font color=#dc143c size=12> Some test cases of torch module fails as mentioned above. But all failed cases is related to LAPack and the amount of them is 21 On my machine (OS:Ubuntu 16.04).</font> 


###Performance
To check the performance on the convnet benchmark, refer to this [page](https://github.com/xhzhao/Optimized-Torch-benchmark)


To check the convergency on the imagenet dataset, refer to this [page](https://github.com/xhzhao/imagenet-CPU.torch)

---
>\* Other names and trademarks may be claimed as the property of others.


