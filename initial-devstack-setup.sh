#!/bin/bash

######################################################
# Script de preparação da VM de convidado            #
# Versão: 1.0 - 18/07/21                             #
######################################################

# Atualização do sistema convidado
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

# Criação do usuário stack e sua inserção no sudoers
sudo useradd -s /bin/bash -d /opt/stack -m stack
sudo echo "stack ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/stack

# Clone do repositório Devstack
sudo git clone https://opendev.org/openstack/devstack /opt/stack/devstack

# Criação do arquivo local.conf dentro repositório baixado
sudo echo '[[local|localrc]]
ADMIN_PASSWORD=admin
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
HOST_IP=
FLAT_INTERFACE=enp0s8
FLOATING_RANGE=192.168.88.224/27
FIXED_RANGE=10.11.12.0/24
FIXED_NETWORK_SIZE=256' > /opt/stack/devstack/local.conf

# Mudando dono e grupo do diretório stack recursivamente para stack 
sudo chown stack:stack -R /opt/stack
