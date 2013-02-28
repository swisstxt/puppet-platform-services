class platform_services_haproxy::member::www(
  $vip
){
  platform_services_haproxy::member{"${::fqdn}-www":
    service => 'www',
    vip => $vip,
    ports => [80,443],
    options => 'check',
  }
}
