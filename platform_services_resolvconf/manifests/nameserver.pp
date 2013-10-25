class platform_services_resolvconf::nameserver(
  $front_ip = false,
  $default_nameserver = [ "193.218.104.190", "193.218.103.253" ]
){
  case ::mpc_bu {
    'srf': {
      include platform_services

      if $front_ip {
        @@resolvconf::nameserver{$front_ip:
          priority => 1,
          tag => 'front',
        }
      }
      @@resolvconf::nameserver{$::ipaddress:
        priority => 1,
        tag => 'internal'
      }
    }
    default: {
      @@resolvconf::nameserver{$default_nameserver:
        priority => 10,
        tag => 'internal',
      }
    }
  }
}
