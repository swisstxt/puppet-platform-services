define platform_services_haproxy::service(
  $ipaddress,
  $ports,
  $options = {},
  $high_available = false,
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
  } ->
  if ($high_available) {
    include keepalived
    keepalived::instance{$name:
      interface   => 'eth0',
      virtual_ips => [ $ipaddress ],
      state       => 'MASTER',
      priority    => 1,
    }
  }
  platform_services_dns::member::zone{"${name}.${::mpc_project}.${::mpc_bu}.mpc":
    domain    => "${::mpc_project}.${::mpc_bu}.mpc",
    hostname  => $name,
    ipaddress => $ipaddress,
  }
}
