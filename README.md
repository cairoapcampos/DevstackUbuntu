# DevstackUbuntu
Instala o Devstack em uma VM Ubuntu utilizando Vagrant e VirtualBox

## Instruções

1.Clonar repositório:

`git clone https://github.com/cairoapcampos/DevstackUbuntu.git`

2.Entrar no diretório e definir permissão de execução para o script `DevstackUbuntu.sh`:
```
cd DevstackUbuntu
chmod +x DevstackUbuntu.sh
```
Este script instalará os pacotes necessários para a criação da VM Ubuntu e criará um diretório na pasta do usuário para a qual copiará 
o arquivo `Vagrantfile` e o script `initial-devstack-setup.sh`. Posteriormente, após o fim da cópia, criará a VM executando o comando `vagrant up` e 
logará na mesma usando o comando `vagrant ssh`.



