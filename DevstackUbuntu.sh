#!/bin/bash

#############################################################################
# Script de criação da VM convidada Ubuntu para o Devstack (DevstackUbuntu) #
# Versão: 1.0 - 18/07/21                                                    #
# Autor: Cairo Ap. Campos                                                   #
#############################################################################

# Variaveis
findVirtualbox=$(which virtualbox | wc -l)
findVagrant=$(which vagrant | wc -l)
findVagrantPlugin=$(vagrant plugin list | grep vagrant-disksize | wc -l)
dirVagrant=devstack


    if [ $findVirtualbox -eq 0 ]
    then
        echo
        echo "O pacote virtualbox não está instalado!"
        sleep 3
        echo
        echo "Instalando pacote... "
        sleep 3
        echo
        sudo apt install virtualbox -y
        clear
    fi

    if [ $findVagrant -eq 0 ]
    then
       echo
       echo "O pacote vagrant não está instalado!"
       sleep 3
       echo
       echo "Instalando pacote... "
       sleep 3
       echo
       sudo apt install vagrant -y
       clear
    fi

    if [ $findVagrantPlugin -eq 0 ]
    then
       echo
       echo "O pacote vagrant-disksize não está instalado!"
       sleep 3
       echo
       echo "Instalando pacote... "
       sleep 3
       echo
       vagrant plugin install vagrant-disksize
       clear
    fi

mkdir -p $HOME/$dirVagrant
cp initial-devstack-setup.sh $HOME/$dirVagrant
chmod +x $HOME/$dirVagrant/initial-devstack-setup.sh
cp Vagrantfile $HOME/$dirVagrant
cd $HOME/$dirVagrant
vagrant up
vagrant ssh
