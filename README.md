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

Caso seja desejado, pode-se alterar o tamanho de disco, o número de núcleos de processador, quantidade de memória RAM em MB e hostname 
editando o arquivo `Vagrantfile`. Por padão, o tamanho do disco foi definido como 80 GB, o número de núcleos de processador foi definido como 4,a quantidade de memória RAM foi definida como 10240 MB (10GB) e o hostname foi definido como openstack.

Configuração padrão do `Vagrantfile`:
```
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.disksize.size = "80GB"
  config.vm.hostname = "openstack"
  config.vm.network "public_network", bridge: "enp8s0"
  config.vm.provider "virtualbox" do |v|
    v.memory = 10240
    v.cpus = 4
    v.name = "openstack"
  end
  config.vm.provision "shell", path: "initial-devstack-setup.sh"
end
```

3. Após acessar a VM openstack via ssh, deve-se virar root e logar com o usuário stack:
```
sudo su
su - stack
```
4. Entrar no diretório devstack e editar o arquivo `local.conf`:
```
cd devstack/
nano local.conf
```
No arquivo `local.conf` deve ser alterada a linha `HOST_IP=` e a linha `FLOATING_RANGE=`.


