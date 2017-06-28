#!/usr/bin/env bash
#OpenBLAS installation from source code
git clone https://github.com/xianyi/OpenBLAS.git ./OpenBLAS
cd OpenBLAS
make USE_OPENMP=1
mkdir ~/OpenBLAS
make install PREFIX=~/OpenBLAS
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/OpenBLAS/lib
SET_LLP="export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:~/OpenBLAS/lib"
echo "$SET_LLP" >> ~/.bashrc
