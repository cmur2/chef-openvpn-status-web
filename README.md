# chef-openvpn-status-web

[![Build Status](https://travis-ci.org/cmur2/chef-openvpn-status-web.png)](https://travis-ci.org/cmur2/chef-openvpn-status-web)

## Description

Installs [openvpn-status-web](https://github.com/cmur2/openvpn-status-web) as gem and configures it from `node['openvpn-status-web']['config']`.

## Usage

Use `recipe[openvpn-status-web::default]` to get openvpn-status-web installed including an init script for Debian and configuration in /opt/openvpn-status-web.

## Requirements

### Platform

For supported Chef/Ruby version see [Travis](https://travis-ci.org/cmur2/chef-openvpn-status-web).

## Recipes

### default

Takes all attributes beneath `node['openvpn-status-web']['config']` and pastes them verbatim into the config.yaml of openvpn-status-web.

## License

chef-openvpn-status-web is licensed under the Apache License, Version 2.0. See LICENSE for more information.
