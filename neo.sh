#!/bin/bash

function install_neo(){
   curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo && 
    dnf install neofetch -y && clear && neofetch
}


function neo(){
    which neofetch > /dev/null
    RETURN_CODE=$?
    if [ "$RETURN_CODE" -eq "0" ]
    then
      # echo "install sucessful"
      neofetch
    else
      # echo "ref install"
      install_neo
    fi
}

# echo $RETURN_CODE
neo
