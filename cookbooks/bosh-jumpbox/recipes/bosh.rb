#
# Cookbook Name:: bosh-jumpbox
# Recipe:: bosh
#
# Author:: Andrei Krasnitski <xaaabk@gmail.com>
#
# Copyright 2015, Andrei Krasnitski
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
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

gems = [
  'rubygems-update', 'bundler', 'fog', 'bosh_cli',
  'bosh-workspace', 'cf-uaac'
]

gems.each do |gem|
  rvm_gem gem do
    ruby_version node['ruby']['version']
  end
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
