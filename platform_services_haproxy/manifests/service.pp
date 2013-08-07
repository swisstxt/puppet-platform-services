define platform_services_haproxy::service(
  $ipaddress,
  $ports,
  $options = {},
  $high_available = false,
) {
  if ($high_available) {
    sysctl::value{'net.ipv4.ip_nonlocal_bind': value => '1'}

    include keepalived
    keepalived::instance{$name:
      interface   => 'eth0',
      virtual_ips => [ $ipaddress ],
      state       => 'MASTER',
      priority    => 1,
    }
    keepalived::vrrp_script{'haproxy': name_is_proces => true }
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
