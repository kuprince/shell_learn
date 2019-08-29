#!/bin/bash
# ====================================================
#   Copyright (C)2019 All rights reserved.
#
#   Author        : underline
#   Email         : vip170706@gmail.com
#   File Name     : redis_install.sh
#   Last Modified : 2019-08-29 19:03
#   Describe      :
#
# ====================================================

function ready(){
    useradd -r redis -s /sbin/nologin && yum install -y gcc tcl jemalloc-devel wget
}


function make_install(){
    cd /tmp &&
    wget -c http://download.redis.io/releases/redis-stable.tar.gz &&
    tar xf redis-stable.tar.gz &&
    cd redis-stable &&
    make && make test &&
    make PREFIX=/usr/local/redis install
}

function env_set(){
    `cat << EOF | sudo tee /etc/profile.d/redis.sh
    PATH=/usr/local/redis/bin:$PATH
    export PATH
EOF`
    source /etc/profile.d/redis.sh && echo "install successful"
}

ready
make_install
env_set

