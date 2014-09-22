#
# Cookbook Name:: aixtest
# Recipe:: default
#
# Copyright (C) 2014 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

aix_toolboxpackage 'less' do
  action :install
end

aix_inittab 'webserverstart' do
  action :remove
end

aix_inittab 'chef' do
  runlevel '2'
  processaction 'once'
  command '/opt/chef/bin/chef-client -d > /dev/console 2>&1'
  action :install
end
