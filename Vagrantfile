Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.provision "shell", path: "bootstrap/ubuntu.sh", privileged: false
end