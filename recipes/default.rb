
require 'yaml'

gem_package "openvpn-status-web"

template "/etc/init.d/openvpn-status-web" do
  source "openvpn-status-web.init.erb"
  owner "root"
  group "root"
  mode 00755
  variables ({
    :daemon => node['openvpn-status-web']['daemon_binary']
  })
end

directory "/opt/openvpn-status-web" do
  owner "root"
  group "root"
  mode 00755
  recursive true
end

def to_ruby(source)
  case source
  when Hash,Mash,Chef::Node::Attribute
    out = {}
    source.each { |k,v| out[k] = to_ruby(v) }
    out
  when Array
    source.map { |e| to_ruby(e) }
  else
    source
  end
end

config = YAML.dump(to_ruby(node['openvpn-status-web']['config']))

file "/opt/openvpn-status-web/config.yaml" do
  content config
  owner "root"
  group "root"
  mode 00644
  notifies :restart, "service[openvpn-status-web]"
end

service "openvpn-status-web" do
  action [:enable, :start]
end
