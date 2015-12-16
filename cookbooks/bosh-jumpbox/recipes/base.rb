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

%w{unzip git libxml2-dev libsqlite3-dev libxslt1-dev libpq-dev
  libmysqlclient-dev zlib1g-dev cmake libcurl4-openssl-dev}.each do |pkg|
  package pkg do
    action :install
  end
end
