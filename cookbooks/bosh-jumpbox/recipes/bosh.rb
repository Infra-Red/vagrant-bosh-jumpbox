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

gem_package 'bosh_cli' do
  version node['bosh']['version']
  action :install
end

gem_package 'bosh-bootstrap' do
  version node['bosh-bootstrap']['version']
  action :install
end

gem_package 'bosh-workspace' do
  version node['bosh-workspace']['version']
  action :install
end

gem_package 'cf-uaac' do
  version node['cf-uaac']['version']
  action :install
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

bash 'Check out a copy of cf-acceptance-tests' do
  cwd '/opt'
  code <<-EOH
    chmod -R 755 go/
    go get -d #{node['cf']['tests']}
    EOH
end
