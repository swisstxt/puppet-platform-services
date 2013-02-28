class platform_services_haproxy::server {
  class{'::haproxy':}

  platform_services_haproxy::server::service{'www':
    ipaddress => '10.101.10.120',
    ports     => [80, 443],
    options   => {
      'balance' => [
        'uri',
      ],
      'mode' => [
        'http',
      ],
      'http-check' => [
        'disable-on-404',
      ],
      'option' => [ 
        'tcplog',
        'ssl-hello-chk',
        'httpchk OPTIONS * HTTP/1.1\r\nHost:\ /',
      ],
    },
  }
}
