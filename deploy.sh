#!/bin/bash

#(1)设置su密码
sudo passwd
su
#(2)更换源
mv /etc/apt/sources.list /etc/apt/sourses.list.backup
cd /etc/apt
cat>>./sources.list<<EOF
deb https://mirrors.ustc.edu.cn/ubuntu/ disco main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ disco main restricted universe multiverse

deb https://mirrors.ustc.edu.cn/ubuntu/ disco-security main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ disco-security main restricted universe multiverse
 
deb https://mirrors.ustc.edu.cn/ubuntu/ disco-updates main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ disco-updates main restricted universe multiverse
 
deb https://mirrors.ustc.edu.cn/ubuntu/ disco-backports main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ disco-backports main restricted universe multiverse
EOF

apt-get update

#(3)常用软件包
apt-get install python python-pip git
apt-get install qemu qemu-system qemu-utils virt-manager
systemctl enable libvirtd
systemctl start libvirtd

#(4)下载常用包
cd /
pip install click request
git clone https://github.com/foxlet/macOS-Simple-KVM.git

cd macOS-Simple-KVM


