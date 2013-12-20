package "yum-utils"

mysql_release_rpm = "/var/chef/cache/mysql-community-release.rpm"
cookbook_file "mysql-community-release.rpm" do
  path mysql_release_rpm
  notifies :run, "execute[add-mysql-package-repo]", :immediately
end

execute "add-mysql-package-repo" do
  command "yum -y localinstall #{mysql_release_rpm}"
  action :nothing
  notifies :run, "execute[enable-mysql55]", :immediately
end

execute "enable-mysql55" do
  command "yum-config-manager --disable mysql56-community && yum-config-manager --enable mysql55-community"
  action :nothing
  notifies :run, "execute[update-yum]", :immediately
end

execute "update-yum" do
  command "yum -y clean all"
  action :nothing
end
