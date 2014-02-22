#
# Cookbook Name:: chef-env-vars
# Recipe:: default
#
# Copyright 2014, OptimisCorp.
#
# All rights reserved - Do Not Redistribute
#

file_content = node['vars'].collect do |variable|
  databag = variable['databag']
  item = variable['item']
  name = variable['name']
  encrypted = variable['encrypted'] == false ? false : true
  provider = encrypted ? Chef::EncryptedDataBagItem : Chef::DataBagItem
  bag = provider.load databag, item
  value = bag[name]

  "export #{name}=#{value}"
end

file '/etc/profile.d/variables.sh' do
  content file_content.join('\n')
end
