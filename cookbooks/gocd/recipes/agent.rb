
template '/etc/default/go-agent' do
  source 'go-agent.erb'
  mode '0644'
  owner 'root'
  group 'root'
  notifies :restart, 'service[go-agent]'
end

remote_file "#{Chef::Config[:file_cache_path]}/go-agent-#{node['gocd']['agent']['version']}.noarch.rpm" do
  source "http://download.go.cd/gocd-rpm/go-agent-#{node['gocd']['agent']['version']}.noarch.rpm"
  action :create
end

rpm_package 'go-agent' do
  source "#{Chef::Config[:file_cache_path]}/go-agent-#{node['gocd']['agent']['version']}.noarch.rpm"
  action :install
end

directory '/var/lib/go-agent/config' do
  owner 'go'
  group 'go'
  mode '0775'
  action :create
end

template '/var/lib/go-agent/config/autoregister.properties' do
  owner 'go'
  group 'go'
  mode '0600'
  source 'autoregister.properties.erb'
  notifies :restart, 'service[go-agent]'
end

service 'go-agent' do
  supports status: true, restart: true, start: true, stop: true
  action [:enable, :start]
end
