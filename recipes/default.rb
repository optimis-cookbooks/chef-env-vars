#
# Cookbook Name:: chef-env-vars
# Recipe:: default
#
# Copyright 2014, OptimisCorp.
#
# All rights reserved - Do Not Redistribute
#

unless node['vars']
  Chef::Log.warn 'No ENV vars are configured'
  return
end

file_content = node['vars'].collect do |variable|
  "export #{variable}=#{Chef::EncryptedDataBagItem.load('env', 'vars')[variable][node.chef_environment]}"
end.join('\n')

file '/etc/profile.d/variables.sh' do
  content file_content
end
