# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provider :aws do |aws, override|
    override.vm.box = "dummy"
    override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

    aws.ami = "ami-5189a661"
  end

  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = "./cookbooks/vagrant-bosh-jumpbox/Berksfile"

  config.vm.provision "chef_zero" do |chef|
    chef.cookbooks_path = 'cookbooks'
    chef.add_recipe "vagrant-bosh-jumpbox"
  end

end
