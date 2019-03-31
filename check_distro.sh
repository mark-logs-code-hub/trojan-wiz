#!/bin/bash
# OS="unknown"
# VER="0"
# linux 点运算符的含义， 点命令和source命令是同义
check_env(){
    if [ -f /etc/os-release ]; then
        # freedesktop.org and systemd
        . /etc/os-release
        OS=$NAME
        VER=$VERSION_ID   
    elif type lsb_release >/dev/null 2>&1; then
        # linuxbase.org
        OS=$(lsb_release -si)
        VER=$(lsb_release -sr)
    elif [ -f /etc/lsb-release ]; then
        # For some versions of Debian/Ubuntu without lsb_release command
        . /etc/lsb-release
        OS=$DISTRIB_ID
        VER=$DISTRIB_RELEASE
    elif [ -f /etc/debian_version ]; then
         # Older Debian/Ubuntu/etc.
         OS=Debian
         VER=$(cat /etc/debian_version)
    # elif [ -f /etc/SuSe-release ]; then
    #     # Older SuSE/etc.
    #     ...
    elif [ -f /etc/redhat-release ]; then
         # Older Red Hat, CentOS, etc.
         # Red Hat Enterprise Linux Server release 6.10 (Santiago)
         # 安装 redhat-lsb-core 之后 lsb_release可用
         OS="CentOS/RHEL"
         #local tmp_str=$(cat /etc/redhat-release)
         VER=$(tr -cd "[0-9]+[\.[0-9]+]?" < /etc/redhat-release)
         
    else
        # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
        # 无法识别的操作系统
        OS="unknown"
        VER="0"
    fi
}
#check_env
#echo $OS
#echo $VER
# cert_dir=/etc/letsencrypt/csr/

# if [ -d ${cert_dir} ]; then
#    echo "cert_dir"
# # fi
# certbot_path=/opt/certbot

# #certbot=$certbot_path/"certbot-auto"
# echo $certbot
# if [ ! -f "$certbot_path/certbot-auto" ];  then
#     # wget -O $certbot_path/certbot-auto https://dl.eff.org/certbot-auto
#     # chmod a+x $certbot_path/certbot-auto
#     echo "已经安装了"
# fi

OS='CentOS/RHEL'

if [[ "$OS" == "Ubuntu" || "$OS" == "Debian GNU/Linux" ]];then    
   echo "ubuntu"
elif [[ "$OS" == "CentOS Linux" || "$OS" == "CentOS/RHEL" || "$OS" == "Red Hat Enterprise Linux Server" ]];then
   echo "rhel"
fi

gcc=$(which gcc)

if [ "$gcc" = "" ];then
  echo "没有gccz"
fi

sh $gcc ss

domain="zzz.google.zz"
#域名测试
# if ! echo $domain | awk '$0 !~ /^d=[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*(\.[A-Za-z]{2,})$/ {exit 1}'; then
#     echo "成功！"
#     #exit 1
# fi
# if ! expr $domain : '[A-Za-z0-9-]\{1,\}\(\.[A-Za-z0-9-]\{1,\}\)*\(\.[A-Za-z]\{2,\}\)$' >/dev/null; then
#     echo "expr 成功！"
#     exit 1
# fi
OS="unknown"
[ $OS == "unknown" ] && { echo "Unsupported OS!"; exit 1; }