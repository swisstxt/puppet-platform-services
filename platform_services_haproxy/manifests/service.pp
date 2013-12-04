define platform_services_haproxy::service(
  $ipaddress,
  $ports,
  $options = {},
  $virtual_router_id = undef
) {

  if $::platform_services_haproxy::server::high_available {
    $network_netmask = $::platform_services::networks_netmask
    if $virtual_router_id {
      keepalived::instance{$virtual_router_id:
        interface    => 'eth0',
        virtual_ips  => [ "$ipaddress/$network_netmask" ],
        state        => 'BACKUP',
        priority     => 150 - $::platform_services::node_nr * 50,
        track_script => [ "haproxy" ],
        auth_type    => "PASS",
        auth_pass    => "635178udDK1AQ123",
      }
    }
  }
  
  # TODO: move this somewhere else...
  $aliasname  = ipv4tohex($ipaddress)
  case $::mpc_bu {
    'srf': {
      network_config { "eth0:${aliasname}":
        ensure    => 'present',
        method    => 'static',
        ipaddress => $ipaddress,
        netmask   => '255.255.252.0',
        onboot    => 'true',
      }->
      exec {"reload interface eth0:${aliasname}":
        command => "/sbin/ifdown eth0:${aliasname};/sbin/ifup eth0:${aliasname}",
        unless => "ifconfig | grep -q '^eth0:${aliasname} '",
      }->
      haproxy::listen{$name:
        ipaddress => $ipaddress,
        ports     => $ports,
        options   => $options,
      }
    }
    default: {
      network_config { "eth0:$shortname":
        ensure    => 'present',
        method    => 'static',
        ipaddress => $ipaddress,
        netmask   => '255.255.255.0',
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
  }

  # Match only first haproxy on Vagrant and all UE's 
  if $hostname =~ /^haproxy(-zrh-01|-bie-01|-1)?$/ {
    platform_services_dns::member::zone{"${name}.${::mpc_zone}.${::mpc_project}.${::mpc_bu}.mpc":
      domain    => "${::mpc_zone}.${::mpc_project}.${::mpc_bu}.mpc",
      hostname  => $name,
      ipaddress => $ipaddress,
    }
  }
}
