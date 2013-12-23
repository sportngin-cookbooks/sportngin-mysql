version = node[:mysql][:server][:percona][:version]
patch_level = node[:mysql][:server][:percona][:patch_level]
release = node[:mysql][:server][:percona][:release]
tag = node[:mysql][:server][:percona][:tag]

node[:mysql][:server][:percona][:packages].each do |package|
package_path = "#{Chef::Config[:file_cache_path]}/Percona-Server-#{package}-#{version}.#{patch_level}-rel#{release}.rpm"


cookbook_file package_path do
    source "Percona-Server-#{package}-#{version.gsub(".","")}-#{version}.#{patch_level}-rel#{release}.#{tag}.rhel6.x86_64.rpm"
    action :create
end

package "Percona-Server-#{package}-#{version.gsub(".","")}" do
    source package_path
    action :install
end

include_recipe "mysql::server"
