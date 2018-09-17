#!/bin/bash


rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh https://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm


yum repolist


yum --enablerepo=elrepo-kernel install kernel-ml


# Efi only
# show menu entries
awk -F\' '$1=="menuentry "{print i++ ":" $2}' /boot/efi/EFI/centos/grub.cfg

sed -i -e 's/GRUB_TIMEOUT=[0-9].*/GRUB_TIMEOUT=0/g' /etc/default/grub
grub2-set-default 0

grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg
