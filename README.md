# DevstackUbuntu
Instala o Devstack em uma VM Ubuntu utilizando Vagrant e VirtualBox

## Instruções

1. Clonar repositório:

`git clone https://github.com/cairoapcampos/DevstackUbuntu.git`

2. Entrar no diretório e alterar o arquivo `Vagrantfile`:

```
cd DevstackUbuntu
nano Vagrantfile
```
No arquivo pode-se alterar o tamanho de disco, o número de núcleos de processador, quantidade de memória RAM em MB e hostname. Por padão, o tamanho do disco foi definido como 80 GB, o número de núcleos de processador foi definido como 4,a quantidade de memória RAM foi definida como 10240 MB (10GB) e o hostname foi definido como openstack.

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

3. Definir permissão de execução para o script `DevstackUbuntu.sh` e executá-lo:
```
chmod +x DevstackUbuntu.sh
./DevstackUbuntu.sh
```

Este script instalará os pacotes necessários para a criação da VM Ubuntu e criará o diretório `devstack` na pasta do usuário para a qual copiará 
o arquivo `Vagrantfile` e o script `initial-devstack-setup.sh`. Posteriormente, após o fim da cópia, criará a VM executando o comando `vagrant up`.

Durante a criação será questionado qual interface deve ser utilizada como bridge. Para evitar problemas durante a instalação deve-se utilizar uma interface ethernet. No exemplo a seguir a interface `enp2s0` é escolhida.

![Interface](https://github.com/cairoapcampos/DevstackUbuntu/blob/main/imgs/interfaces.png)

Após a VM ser criada ela será acessada via SSH usando o comando `vagrant ssh`. Ao fazer o login ssh, seram mostradas algumas informações. Entre elas
pode-se notar os IPs associados a cada interface. No exemplo asseguir é mostrado estas informações:

![PosLoginSSH](https://github.com/cairoapcampos/DevstackUbuntu/blob/main/imgs/posLoginSSH.png)


4. Após acessar a VM openstack via ssh, deve-se virar root e logar com o usuário stack:
```
sudo su
su - stack
```
5. Entrar no diretório devstack e editar o arquivo `local.conf`:
```
cd devstack/
nano local.conf
```
No arquivo `local.conf` deve ser alterada a linha `HOST_IP=` e a linha `FLOATING_RANGE=`. No exemplo a seguir é definido o IP 192.168.88.39 da inerface `enp0s8` para `HOST_IP` e o range 192.168.88.224/27 para `FLOATING_RANGE`.


![ArquivoConfig](https://github.com/cairoapcampos/DevstackUbuntu/blob/main/imgs/arquivoConfig.png)

6. Após alterar o arquivo `local.conf` para instalar o Devstack basta executar o script seguinte:

`./stack.sh`

Ao ser concluída a instalação serão mostradas algumas informações. Entre elas é mostrada a url de acesso do dashboard Horizon. No exemplo a seguir ela é `http://192.168.88.39/dashboard`:

![FimInstalacao](https://github.com/cairoapcampos/DevstackUbuntu/blob/main/imgs/fimInstalacao.png)


## Fontes:

`https://mateusmuller.me/posts/2020-04-26-openstack-como-instalar-devstack-com-vagrant-para-homelab/`
`https://www.youtube.com/watch?v=bh2CHlxyIvw&list=PL0zspxm7AK_DsypYjkFVEU7ZxPn5gReKF&index=3`


