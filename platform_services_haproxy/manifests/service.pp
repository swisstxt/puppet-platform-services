define platform_services_haproxy::service(
  $ipaddress,
  $ports,
  $options = {},
) {

  network_config { "eth0:$name":
    ensure    => 'present',
    method    => 'static',
    ipaddress => $ipaddress,
    netmask   => '255.255.252.0',
    onboot    => 'true',
  }~> 
  exec {"reload interface eth0:$name":
    command => "/sbin/ifdown eth0:$name;/sbin/ifup eth0:$name",
    refreshonly => true,
  }->
  haproxy::listen{$name:
    ipaddress => $ipaddress,
    ports     => $ports,
    options   => $options,
  }
  
  platform_services_dns::member::zone{"${name}.${::mpc_project}.${::mpc_bu}.mpc":
    domain    => "${::mpc_project}.${::mpc_bu}.mpc",
    hostname  => $name,
    ipaddress => $ipaddress,
  }
}
