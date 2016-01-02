#
# Cookbook Name:: bosh-jumpbox
# Recipe:: bosh
#
# Copyright 2015, Andrei Krasnitski
#
# All rights reserved - Do Not Redistribute
#
remote_file node['bosh-init']['path'] do
  source node['bosh-init']['release']
  owner 'root'
  group 'root'
  mode '0755'
  checksum node['bosh-init']['checksum']
  action :create
end

ark 'spiff' do
  url node['spiff']['release']
  creates 'spiff'
  path node['spiff']['path']
  mode 0755
  checksum node['spiff']['checksum']
  action :cherry_pick
end

gem_package 'rubygems-update' do
  action :upgrade
end

gem_package 'fog' do
  version node['fog']['version']
  action :upgrade
end

gem_package 'bosh_cli' do
  action :upgrade
end

gem_package 'bosh-bootstrap' do
  action :upgrade
end

gem_package 'bosh-workspace' do
  action :upgrade
end

gem_package 'cf-uaac' do
  action :upgrade
end

remote_file "#{Chef::Config['file_cache_path']}/cf-cli-installer-#{node['cf-cli']['version']}.deb" do
  source node['cf-cli']['release']
  mode 0644
  checksum node['cf-cli']['checksum']
end

dpkg_package "cf-cli-#{node['cf-cli']['version']}" do
  source "#{Chef::Config['file_cache_path']}/cf-cli-installer-#{node['cf-cli']['version']}.deb"
  action :install
end
