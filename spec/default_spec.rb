require 'chefspec'
begin require 'chefspec/deprecations'; rescue LoadError; end

describe 'openvpn-status-web::default' do
  let(:chef_runner) do
    cb_path = [Pathname.new(File.join(File.dirname(__FILE__), '..', '..')).cleanpath.to_s, 'spec/support/cookbooks']
    ChefSpec::ChefRunner.new(:cookbook_path => cb_path)
  end

  let(:chef_run) do
    chef_runner.node.set['openvpn-status-web']['config'] = {
    }
    chef_runner.node.automatic_attrs['platform_family'] = 'debian'
    chef_runner.converge 'openvpn-status-web::default'
  end
  
  it 'installs openvpn-status-web gem' do
    expect(chef_run).to install_gem_package 'openvpn-status-web'
  end

  it 'configures openvpn-status-web' do
    expect(chef_run).to create_file_with_content "/opt/openvpn-status-web/config.yaml", ""
  end

  it 'creates an init.d script' do
    expect(chef_run).to create_file_with_content "/etc/init.d/openvpn-status-web", ""
  end
  
  it 'enables and starts openvpn-status-web' do
    expect(chef_run).to start_service "openvpn-status-web"
    expect(chef_run).to set_service_to_start_on_boot "openvpn-status-web"
  end
end
