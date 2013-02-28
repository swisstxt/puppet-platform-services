define platform_services_haproxy::server::service(
  $ipaddress,
  $ports,
  $options = {},
) {
  haproxy::listen{$name:
    ipaddress => $ipaddress,
    ports     => $ports,
    options   => $options,
  } <-
  network::alias{"eth0:$name":
    network => $::network_front,
    ipaddress => $ipaddress,
    netmask => '255.255.255.0',
  }
  platform_services_dns::member::zone{"${name}.${::project}.${::ue}.mpc":
    domain    => "${::project}.${::ue}.mpc",
    hostname  => $name,
    ipaddress => $ipaddress,
  }
}
