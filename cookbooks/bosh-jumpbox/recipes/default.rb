#
# Cookbook Name:: bosh-jumpbox
# Recipe:: default
#
# Copyright 2015, Andrei Krasnitski
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'vagrant-bosh-jumpbox::base'
include_recipe 'vagrant-bosh-jumpbox::bosh'
