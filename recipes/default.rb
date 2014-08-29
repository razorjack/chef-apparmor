#
# Cookbook Name:: apparmor
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'apparmor-utils' do
  action :install
end

package 'apparmor-profiles' do
  action :install
end

service 'apparmor' do
  supports :status => true
  action [:enable, :start]
end
