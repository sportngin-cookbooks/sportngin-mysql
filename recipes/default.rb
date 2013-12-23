version = node[:mysql][:server][:percona][:version]
patch_level = node[:mysql][:server][:percona][:version]
release = node[:mysql][:server][:percona][:release]
tag = node[:mysql][:server][:percona][:tag]
package_path = "#{Chef::Config[:file_cache_path]}/Percona-Server-server-#{version}#{patch_level}-rel#{release}.rpm"


remote_file package_path do
    source "http://www.percona.com/redir/downloads/Percona-Server-#{version}/Percona-Server-#{version}.#{patch_level}-#{release}/RPM/rhel6/x86_64/Percona-Server-server-#{version.gsub(".","")}-#{version}.#{patch_level}-rel#{release}.#{tag}.rhel6.x86_64.rpm"
    action :create
end

rpm_package "Percona-Server-server-#{version.gsub(".","")}" do
    source package_path
    action :install
end
include_recipe "mysql::server"
