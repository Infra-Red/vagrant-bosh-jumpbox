#
# Cookbook Name:: bosh-jumpbox
# Recipe:: base
#
# Copyright 2015, Andrei Krasnitski
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'apt'
include_recipe 'ark'
include_recipe 'ruby-ng::dev'
include_recipe 'golang'

packages = [
  'vim', 'zip', 'unzip', 'curl', 'wget', 'unzip', 'git', 'libxml2-dev',
  'libsqlite3-dev', 'libxslt1-dev', 'libpq-dev', 'libmysqlclient-dev',
  'zlib1g-dev', 'cmake', 'libcurl4-openssl-dev', 'build-essential'
]

packages.each do |pkg|
  package pkg do
    action :install
  end
end

remote_file node['direnv']['path'] do
  source node['direnv']['release']
  owner 'root'
  group 'root'
  mode '0755'
  checksum node['direnv']['checksum']
  action :create
  notifies :run, 'bash[direnv_shell]', :immediately
end

bash 'direnv_shell' do
  code <<-EOH
  echo 'eval "direnv hook bash"' >> /home/ubuntu/.bashrc
  EOH
  user 'ubuntu'
  action :nothing
end
