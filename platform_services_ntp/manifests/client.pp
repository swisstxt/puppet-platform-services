class platform_services_ntp::client (
  $servers = [
    '0.centos.pool.ntp.org',
    '1.centos.pool.ntp.org',
    '2.centos.pool.ntp.org',
  ],
) {
  class { '::ntp':
    servers  => $servers,
    restrict => 'restrict 127.0.0.1',
  }
}
