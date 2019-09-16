function set_yum(){
    rpm -ivh http://mirrors.aliyun.com/epel/epel-release-latest-7.noarch.rpm && yum clean all && yum makecache && yum update -y
}


function install_app(){
    yum install -y vim git tree lsof tcp wget tcpdump nc nmap openssl-devel ntpdate 
}


function install_docker(){
    yum install -y yum-utils device-mapper-persistent-data lvm2 && 
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && yum -y install docker-ce && systemctl start docker && systemctl enable docker && docker version 
    echo '{
  "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn/"]
}' > /etc/docker/daemon.json
}


function install_docker_compose(){
    curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
}


function set_static_ip(){
    sed -i 's/BOOTPROTO="dhcp"/BOOTPROTO="static"\nIPADDR="192.168.0.204"\nNETMASK="255.255.255.0"\nGATEWAY="192.168.0.1"\nDNS1="114.114.114.114"/' /etc/sysconfig/network-scripts/ifcfg-eth0 && echo "static ip is successful" && systemctl restart network.service
}


function set_root_ssh(){
    sed -i 's#\#PermitRootLogin yes#PermitRootLogin yes#g' /etc/ssh/sshd_config
}


function set_hostname(){
    hostnamectl set-hostname im1
}


function close_firewall(){
    systemctl stop firewalld && systemctl disable firewalld && setenforce 0 && sed -i '/SELINUX/s/enforcing/disabled/' /etc/selinux/config
}

function set_config(){
    close_firewall
    set_hostname
    set_root_ssh
    set_static_ip
}

function main(){
    set_yum
    install_app
    install_docker
    install_docker_compose
    set_config
}
main
