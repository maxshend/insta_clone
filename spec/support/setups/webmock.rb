# frozen_string_literal: true

require 'webmock/rspec'

allowed_hosts = [
  /#{ENV.fetch('SELENIUM_HOST', nil)}/,
  /#{IPSocket.getaddress ENV.fetch('HOSTNAME', nil)}/
]

WebMock.disable_net_connect!(allow_localhost: true, allow: allowed_hosts)
