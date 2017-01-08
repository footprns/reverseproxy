#
# Cookbook Name:: reverseproxy
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Install and set service for Apache
yum_package 'httpd' do
  action :install
end

service 'httpd' do
  action [ :start, :enable]
end

# set reverse proxy configuration
template '/etc/httpd/conf.d/r_proxy.conf' do
  action :create
  source 'r_proxy.conf.erb'
  # variables ({
  #  :target_ip => '123.123.123.123'
  #  })
   notifies :restart, 'service[httpd]', :immediately
  backup 10
end


# yum_package 'openldap-servers' do
#   action :install
# end
#
# service 'slapd' do
#   action [ :start, :enable]
# end
#
# yum_package 'openldap-clients' do
#   action :install
# end
#
# yum_package 'epel-release' do
#   action :install
# end
#
# yum_package 'phpldapadmin' do
#   action :install
# end
#
# template '/etc/httpd/conf.d/phpldapadmin.conf' do
#   action :create
#   source 'phpldapadmin.conf.erb'
#   backup 10
# end
