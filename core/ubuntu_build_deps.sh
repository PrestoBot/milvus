#!/bin/bash

wget -P /tmp https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
apt-key add /tmp/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB

sh -c 'echo deb https://apt.repos.intel.com/mkl all main > /etc/apt/sources.list.d/intel-mkl.list'
apt-get -y update && apt-get -y install intel-mkl-gnu-2019.5-281 intel-mkl-core-2019.5-281

apt-get install -y gfortran libmysqlclient-dev mysql-client libcurl4-openssl-dev libboost-system-dev \
libboost-filesystem-dev libboost-serialization-dev libboost-regex-dev liblapack3 libssl-dev

if [ ! -f "/usr/lib/x86_64-linux-gnu/libmysqlclient_r.so" ]; then
    ln -s /usr/lib/x86_64-linux-gnu/libmysqlclient.so /usr/lib/x86_64-linux-gnu/libmysqlclient_r.so
fi

dpkg -i ./thirdparty/gsi/gdl_sources_milvus/gsi-sys-full-libs-120.11.300.9.deb
