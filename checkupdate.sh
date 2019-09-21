#!/bin/bash

DT=$(date '+%H:%M:%S')
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
        echo "$DT"
        echo -e "\033[31m最后更新时间--->\033[0m" $(ls -l $new_name | awk '{print $(NF-1)}')
    else 
        echo "$DT"
        echo -e "\033[31m=====快去更新=====033[0m"
    fi
}

function main(){
    cd /tmp &&
    mv_old &&
    pull_newfile &&
    check_data
}

main
