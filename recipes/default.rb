#
# Cookbook Name:: chef-env-vars
# Recipe:: default
#
# Copyright 2014, OptimisCorp.
#
# All rights reserved - Do Not Redistribute
#

begin
  bag = Chef::EncryptedDataBagItem.load 'env', 'vars'
rescue
  Chef::Log.warn 'The env vars databag does not exist.'
  return
end

vars = bag.to_hash.collect do |key, value|
  { "#{key}" => value[node.chef_environment] } if value[node.chef_environment]
end.compact

Chef::Log.warn "No env vars configured for env #{node.chef_environment}." and return if vars.empty?

file_content = vars.map { |var| "export #{var.keys.first}=#{var.values.first}" }.join('\n')

file '/etc/profile.d/variables.sh' do
  content file_content
end
