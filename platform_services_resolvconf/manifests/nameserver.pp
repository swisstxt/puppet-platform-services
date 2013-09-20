# Version von platform_services_resolvconf::nameserver welche für den Moment funktioniert.
# Die Swisstxt Nameserver - inklusive derjenige von Cloudstack' - delegieren momentan nicht
# an unsere Server.
# Um irgendwie weiter arbeiten zu können: Diese Lösung!

class platform_services_resolvconf::nameserver( $vip,
                                              )
{

  Class['::platform_services_resolvconf::nameserver'] <- Class['::dns::server::service']

  if $default_nameserver {
    @@resolvconf::nameserver{$default_nameserver:
      priority => 1,
    }
  }
  else {
    $default_nameserver = regsubst(baseip(), '^(\d+)\.(\d+)\.(\d+)\.(\d+)$',  '\1.\2.\3.1')
    if $default_nameserver != $::ipaddress {
      @@resolvconf::nameserver{$default_nameserver:
        ensure   => absent,
        priority => 10,
        tag      => 'internal',
      }
    }
  }

  @@resolvconf::nameserver{$::ipaddress:
    priority => 1,
  }

  @@resolvconf::nameserver{'193.218.104.190':
    ensure   => absent,
  }

  @@resolvconf::nameserver{'193.218.103.253':
    ensure   => absent,
  }

  @@resolvconf::nameserver{'8.8.8.8':
    ensure   => present,
    priority => 2,
  }
}
