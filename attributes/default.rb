
default['openvpn-status-web'] = {
  'daemon_binary' => '/var/lib/gems/1.9.1/bin/openvpn-status-web',
  'config' => {
    'host' => '0.0.0.0',
    'port' => '80',
    'vpns' => {
    }
  }
}
