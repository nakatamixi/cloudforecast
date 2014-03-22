#
# Cookbook Name:: cloudforecast
# Recipe:: default
#
# Copyright 2014, Jun Ichikawa
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

case node[:platform]
  when 'centos','redhat','fedora','amazon'
    %w{
      git net-snmp-perl net-snmp net-snmp-utils rrdtool-perl
    }.each do |pkg|
      package pkg do
        action :install
      end
    end
  when 'debian','ubuntu'
    %w{
      git libsnmp-perl librrds-perl snmp snmpd rrdtool
    }.each do |pkg|
      package pkg do
        action :install
      end
    end
end

git "#{node[:cloudforecast][:install_dir]}/" do
  repository node[:cloudforecast][:git_repository]
  reference node[:cloudforecast][:git_revision]
  action :checkout
end

bash "install CPAN" do
  cwd "#{node[:cloudforecast][:install_dir]}/"
  code <<-EOH
    wget --no-check-certificate http://cpanmin.us/ -O cpanm
    perl cpanm -v -L extlib Module::Install CPAN CGI
    perl cpanm -v -L extlib --installdeps .
  EOH
  user "#{node[:cloudforecast][:user]}"
end

directory "#{node[:cloudforecast][:cf_yaml][:config][:data_dir]}" do
  owner "#{node[:cloudforecast][:user]}"
  group "#{node[:cloudforecast][:group]}"
  mode 0644
  action :create
end

directory"#{node[:cloudforecast][:log_path]}" do
  owner "#{node[:cloudforecast][:user]}"
  group "#{node[:cloudforecast][:group]}"
  mode 0644
  action :create
end

directory "#{node[:cloudforecast][:lock_path]}" do
  owner "#{node[:cloudforecast][:user]}"
  group "#{node[:cloudforecast][:group]}"
  mode 0644
  action :create
end

template "/etc/init.d/cloudforecast_radar" do
  source "cloudforecast_radar.erb"
  mode 0755
end

template "/etc/init.d/cloudforecast_web" do
  source "cloudforecast_web.erb"
  mode 0755
end

template "#{node[:cloudforecast][:install_dir]}/cloudforecast.yaml" do
  source "cloudforecast.yaml.erb"
  variables(
    :cf_yaml => node[:cloudforecast][:cf_yaml]
  )
end
