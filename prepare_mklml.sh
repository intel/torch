#!/bin/sh
# set -ex
FindLibrary() 
{
  case "$1" in
    intel|1)
      LOCALMKLML=`find $DST -name libmklml_intel.so`   # name of MKL SDL lib
      ;;
    *)
      LOCALMKLML=`find $DST -name libmklml_gnu.so`   # name of MKL SDL lib
      ;;
  esac

}

GetVersionName()
{
VERSION_LINE=0
if [ $1 ]; then
  VERSION_LINE=`grep __INTEL_MKL_BUILD_DATE $1/include/mkl_version.h 2>/dev/null | sed -e 's/.* //'`
fi
if [ -z $VERSION_LINE ]; then
  VERSION_LINE=0
fi
echo $VERSION_LINE  # Return Version Line
}

# MKLML
DST=`dirname $0`
OMP=0 
VERSION_MATCH=20170425
ARCHIVE_BASENAME=mklml_lnx_2018.0.20170425.tgz
MKLML_CONTENT_DIR=`echo $ARCHIVE_BASENAME | rev | cut -d "." -f 2- | rev`
GITHUB_RELEASE_TAG=v0.9
MKLMLURL="https://github.com/01org/mkl-dnn/releases/download/$GITHUB_RELEASE_TAG/$ARCHIVE_BASENAME"
# there are diffrent MKL lib to be used for GCC and for ICC
reg='^[0-9]+$'
#echo "----->"  $DST
VERSION_LINE=`GetVersionName $MKLMLROOT`
# Check if MKLMLROOT is set if positive then set one will be used..
if [ -z $MKLMLROOT ] || [ $VERSION_LINE -lt $VERSION_MATCH ]; then
	# ..if MKLROOT is not set then check if we have MKL downloaded in proper version
    VERSION_LINE=`GetVersionName $DST/$MKLML_CONTENT_DIR`
    if [ $VERSION_LINE -lt $VERSION_MATCH ] ; then
      #...If it is not then downloaded and unpacked
      wget --no-check-certificate -P $DST $MKLMLURL -O $DST/$ARCHIVE_BASENAME
      tar -xzf $DST/$ARCHIVE_BASENAME -C $DST
    fi

  FindLibrary $1
  #echo "----- $LOCALMKLML"
  MKLMLROOT=$PWD/`echo $LOCALMKLML | sed -e 's/lib.*$//'`
fi

# Check what MKL lib we have in MKLROOT
if [ -z `find $MKLMLROOT -name libmkl_rt.so -print -quit` ]; then
  LIBRARIES=`basename $LOCALMKLML | sed -e 's/^.*lib//' | sed -e 's/\.so.*$//'`
  OMP=1
else
  echo "MKL instead of mklml"
  LIBRARIES="mkl_rt"
fi 

#echo "=====>  $MKLMLROOT"

# return value to calling script (Makefile,cmake)
echo $MKLMLROOT $LIBRARIES $OMP


