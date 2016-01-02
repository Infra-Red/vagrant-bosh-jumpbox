# -*- mode: ruby -*-
# vi: set ft=ruby :
require_relative 'aws_vars.rb'
include VarsAws

Vagrant.configure("2") do |config|

  config.vm.provider :aws do |aws, override|
    override.vm.box = AWS_NAME
    override.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

    aws.block_device_mapping = [{
      'DeviceName' => '/dev/sda1',
      'Ebs.VolumeSize' => 20,
      'Ebs.VolumeType' => 'gp2',
      'Ebs.DeleteOnTermination' => 'true' }]

    aws.ami = AWS_UBUNTU_AMI
    aws.access_key_id = AWS_ACCESS_KEY
    aws.secret_access_key = AWS_SECRET_KEY
    aws.keypair_name = AWS_KEY_PEMNAME
    aws.region = AWS_REGION
    aws.security_groups = AWS_SECURITY_GROUPS
    aws.instance_type = AWS_TYPE_INS
    aws.tags = {
      'Name' => AWS_NAME,
    }

    # SSH:
    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = AWS_KEY_PEMPATH
  end

  config.omnibus.chef_version = :latest

  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = "./cookbooks/bosh-jumpbox/Berksfile"

  config.vm.provision "chef_zero" do |chef|
    chef.cookbooks_path = 'cookbooks'
    chef.add_recipe "bosh-jumpbox"
  end

end
