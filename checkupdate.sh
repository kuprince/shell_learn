#!/bin/bash

DT=$(date '+%H%M%S')
old_name='yh2_linux.out'
new_name='new'${old_name}

function mv_old(){
    mv $old_name $new_name
}

function pull_newfile(){
    rsync -aqz root@192.168.0.201:/opt/yh2/yh2_linux.out ./
}

function check_data(){
    if [ $(ls -l $old_name | awk '{print $(NF-1)}') == $(ls -l $new_name | awk '{print $(NF-1)}') ]; then
        echo '最后更新时间--->' $(ls -l $new_name | awk '{print $(NF-1)}')
    else 
        echo "快去更新"
    fi
}

function main(){
    cd /tmp &&
    mv_old &&
    pull_newfile &&
    check_data
}

main
