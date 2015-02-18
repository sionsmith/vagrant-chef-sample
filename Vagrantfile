# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "HHVM_Ubuntu12"
    config.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

    config.vm.provider :aws do |aws, override|
        aws.access_key_id = ""
        aws.secret_access_key = ""
        aws.keypair_name = ""
        aws.region = "eu-west-1"
        aws.ami = "ami-234ecc54"
        aws.instance_type = "m3.medium"
        override.ssh.username = "ubuntu"
        override.ssh.private_key_path = ""
    end 

    # Enable provisioning with Chef Solo
    config.vm.provision :chef_solo do |chef|   
        chef.json.merge!(JSON.parse(File.read('node.json')))
        chef.run_list = JSON.parse(File.read('node.json'))['run_list']
        chef.log_level = :debug
    end
end
