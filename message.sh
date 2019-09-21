#!/bin/bash

# 给所有在线用户发消息
TTY=$(who | awk '{print $2}')
DT=$(date '+%H:%M:%S')
MEG='Are you OK?'
for _ in $TTY
do
    /usr/bin/echo -e $DT'\n'$MEG > /dev/$_
    # /usr/bin/sh > /dev/$_
done
