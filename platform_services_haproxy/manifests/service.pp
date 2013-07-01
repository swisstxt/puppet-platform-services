define platform_services_haproxy::service(
  $ipaddress,
  $ports,
  $options = {},
) {
  haproxy::listen{$name:
    ipaddress => $ipaddress,
    ports     => $ports,
    options   => $options,
  } <-
  network::if::alias{"eth0:$name":
    ensure => up,
    ipaddress => $ipaddress,
    netmask => '255.255.255.0',
  }
  platform_services_dns::member::zone{"${name}.${::mpc_project}.${::mpc_bu}.mpc":
    domain    => "${::mpc_project}.${::mpc_bu}.mpc",
    hostname  => $name,
    ipaddress => $ipaddress,
  }
}
