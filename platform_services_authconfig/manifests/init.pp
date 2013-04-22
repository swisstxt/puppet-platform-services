class platform_services_authconfig {
  host{'dirsrv01.stxt.mpc':
    ip => '10.100.219.85',
  } ~>
  class{'authconfig':
    sssd => hiera('sssd', true),
    sssdauth => hiera('sssdauth', true),
    mkhomedir => hiera('mkhomedir', true),
    ldaploadcacert => hiera('ldaploadcacert', 'https://gist.github.com/anonymous/5388220/raw/e4ab3a59fb5459ca74e72a8ae74318e4b84151cf/swisstxtCA'),
  }
}
