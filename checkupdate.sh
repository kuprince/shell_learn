#!/bin/bash

DT=$(date '+%H:%M:%S')
TTY=$(who | awk '{print $2}')
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
        echo -e "\033[5;31m=====快去更新=====\033[0m"
        # 红字闪烁提醒
        # \033[1;m 设置高亮加粗
        # \033[4;m 下划线
        # \033[5;m 闪烁
        # 颜色
        # echo -e "\033[30m str \033[0m"      ## 黑色字体
        # echo -e "\033[31m str \033[0m"      ## 红色
        # echo -e "\033[32m str \033[0m"      ## 绿色
        # echo -e "\033[33m str \033[0m"      ## 黄色
        # echo -e "\033[34m str \033[0m"      ## 蓝色
        # echo -e "\033[35m str \033[0m"      ## 紫色
        # echo -e "\033[36m str \033[0m"      ## 青色
        # echo -e "\033[37m str \033[0m"      ## 白色
    fi
}

function main(){
    cd /tmp &&
    mv_old &&
    pull_newfile
    # 给所有在线用户发消息
    for _ in $TTY
    do
        check_data > /dev/$_
    done
}

main
