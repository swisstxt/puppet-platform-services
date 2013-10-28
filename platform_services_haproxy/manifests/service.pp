define platform_services_haproxy::service(
  $ipaddress,
  $ports,
  $options = {},
  $virtual_router_id = undef
) {

  if $::platform_services_haproxy::server::high_available {
    $network_netmask = ::platform_services::network_netmask
    if ! $virtual_router_id {
         $octets = split($::mpc_network_front, '\.')
         $virtual_router_id = $last_octet
    }         

    keepalived::instance{$virtual_router_id:
      interface    => 'eth0',
      virtual_ips  => [ "$ipaddress/$network_netmask" ],
      state        => 'MASTER',
      priority     => 1,
      track_script => [ "haproxy" ],
      auth_type    => "PASS",
      auth_pass    => "635178udDK1AQ123",
    }

  }
  
  # TODO: move this somewhere else...
  $shortname  = regsubst($name,'^(.{1,10}).*$','\1')
  case $::mpc_bu {
    'srf': {
      network_config { "eth0:$shortname":
        ensure    => 'present',
        method    => 'static',
        ipaddress => $ipaddress,
        netmask   => '255.255.252.0',
        onboot    => 'true',
      }->
      exec {"reload interface eth0:$shortname":
        command => "/sbin/ifdown eth0:$shortname;/sbin/ifup eth0:$shortname",
        unless => "ifconfig | grep -q '^eth0:${shortname} '",
      }->
      haproxy::listen{$name:
        ipaddress => $ipaddress,
        ports     => $ports,
        options   => $options,
      }
    }
    default: {
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
    }
  }

  # Match only first haproxy 
  if $hostname =~ /^haproxy-?0?1$/ {
    platform_services_dns::member::zone{"${name}.${::mpc_zone}.${::mpc_project}.${::mpc_bu}.mpc":
      domain    => "${::mpc_zone}.${::mpc_project}.${::mpc_bu}.mpc",
      hostname  => $name,
      ipaddress => $ipaddress,
    }
  }
}
