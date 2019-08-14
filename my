#!/bin/bash

# help
function helps(){
    echo "my ip"
    echo "	查看本机出口ip地址"
    echo "my info"
    echo "	查看本机信息"
    echo "my net"
    echo "	查看本机网络是否正常"
    echo "my help"
    echo "	查看帮助信息"
}

# check ipaddr
function ip(){
    if ( command -v curl > /dev/null ); then
        curl myip.ipip.net
    else
        echo "curl not found, Please install curl"
    fi
}

# install neofetch
function yum_install_neo(){
   curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo && dnf install neofetch -y && clear && neofetch
}
function check_system_and_install_neo(){
    if(command -v apt > /dev/null); then
       apt update -y && apt install neofetch -y
    elif(command -v yum > /dev/null);then
       yum_install_neo
    elif(command -v dnf > /dev/null);then
       dnf install neofetch -y
    elif(command -v zypper> /dev/null);then
       zypper install neofetch -y
    elif(command -v pacman> /dev/null);then
       echo "pacman"
       apt update -y && apt install neofetch -y
    else 
       echo "This system is not supported"
    fi
}

# start neofetch
function neo(){
    if ( command -v neofetch > /dev/null); then
      # echo "install sucessful"
      neofetch
    else
      # echo "ref install"
      check_system_and_install_neo
    fi
}

# ping g.cn
function network(){
    if (ping -c 2 g.cn > /dev/null); then
        echo "网络连接正常"
    else
        echo "网络不可达,请检查网络!!!"
    fi
}

# main
function main(){
case $1 in
     ip | IP)
          ip ;;
     info | INFO)
          neo;;
     net | network | NETWORK)
          network;;
     *)
          helps;;
esac

}
main $1
