#
# Cookbook Name:: cloudforecast
# Recipe:: upgrade_perl
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

package 'perl' do
  action :remove
  not_if 'which perl'
end

bash 'install perl' do
  code <<-EOH
    cd /tmp
    wget #{node[:cloudforecast][:perl_url]}
    tar xfvz perl*
    cd perl*
    ./Configure #{node[:cloudforecast][:perl_config]}
    make && make install
  EOH
  user 'root'
end