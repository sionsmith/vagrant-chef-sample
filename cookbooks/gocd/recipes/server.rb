
template '/etc/default/go-server' do
  source 'go-server.erb'
  mode '0644'
  owner 'root'
  group 'root'
  notifies :restart, 'service[go-server]'
end

remote_file "#{Chef::Config[:file_cache_path]}/go-server-#{node['gocd']['server']['version']}.noarch.rpm" do
  source "http://download.go.cd/gocd-rpm/go-server-#{node['gocd']['server']['version']}.noarch.rpm"
  action :create
end

rpm_package 'go-server' do
  source "#{Chef::Config[:file_cache_path]}/go-server-#{node['gocd']['server']['version']}.noarch.rpm"
  action :install
end

service 'go-server' do
  supports status: true, restart: true, start: true, stop: true
  action [:enable, :start]
end
