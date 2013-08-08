define platform_services_haproxy::service(
  $ipaddress,
  $ports,
  $options = {},
  $virtual_router_id = undef
) {
  if $::platform_services_haproxy::server::high_available {
    if ! $virtual_router_id {
        fail("virtual_router_id must be defined if high available")
    } else {
      keepalived::instance{$virtual_router_id:
        interface    => 'eth0',
        virtual_ips  => [ "$ipaddress/24" ],
        state        => 'MASTER',
        priority     => 1,
        track_script => [ "haproxy" ],
        auth_type    => "PASS",
        auth_pass    => "635178udDK1AQ123",
      }
    }
  }
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
