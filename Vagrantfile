Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.disksize.size = "80GB"
  config.vm.hostname = "openstack-new"
  config.vm.network "public_network", bridge: "enp8s0"
  config.vm.provider "virtualbox" do |v|
    v.memory = 10240
    v.cpus = 4
    v.name = "openstack-new"
  end
  config.vm.provision "shell", path: "initial-devstack-setup.sh"
end

