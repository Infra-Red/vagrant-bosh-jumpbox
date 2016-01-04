#
# Cookbook Name:: bosh-jumpbox
# Attributes:: default
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

default['bosh-init']['checksum'] = 'b73ef142cf5ce1e73f99a274e2868a21c29e6b596182478dfc1b3e95e989f7f5'
default['bosh-init']['path'] = '/usr/local/bin/bosh-init'
default['bosh-init']['release'] = 'https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-0.0.81-linux-amd64'
default['cf-cli']['checksum'] = '65773a4abc61e43f7031bbb3222bba0f4bf3912748245f35b701921165987b92'
default['cf-cli']['release'] = 'http://go-cli.s3-website-us-east-1.amazonaws.com/releases/v6.14.1/cf-cli-installer_6.14.1_x86-64.deb'
default['cf-cli']['version'] = '6.14.1'
default['direnv']['checksum'] = '8b9fc5362e8f4d338f73fe022026423ffbf72c316a6ef8447629e08a1488422d'
default['direnv']['path'] = '/usr/local/bin/direnv'
default['direnv']['release'] = 'https://github.com/direnv/direnv/releases/download/v2.6.0/direnv.linux-amd64'
default['ruby']['version'] = 'ruby-2.0.0-p648'
default['rvm']['keyserver'] = 'hkp://keys.gnupg.net'
default['rvm']['recv-keys'] = '409B6B1796C275462A1703113804BB82D39DC0E3'
default['rvm']['user']['home'] = '/home/ubuntu'
default['rvm']['user']['name'] = 'ubuntu'
default['spiff']['checksum'] = 'a34ee47a75dee89b5195d5901a4230105a5e8249b57b1c63e1c982afacfbc627'
default['spiff']['path'] = '/usr/local/bin/'
default['spiff']['release'] = 'https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.7/spiff_linux_amd64.zip'
