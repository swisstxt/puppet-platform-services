class platform_services_pnp4nagios {
  include pnp4nagios
  file { '/etc/httpd/conf.d/pnp4nagios.conf':
    ensure => present,
    source => 'puppet:///modules/platform_services_pnp4nagios/pnp4nagios.conf',
  }

  nagios_command { 'process-service-perfdata-file':
    command_line => '/usr/bin/perl /usr/libexec/pnp4nagios/process_perfdata.pl --bulk=/var/icinga/spool/service-perfdata',
    require => Package['pnp4nagios'],
  }

  nagios_command{'process-host-perfdata-file':
    command_line => '/usr/bin/perl /usr/libexec/pnp4nagios/process_perfdata.pl --bulk=/var/icinga/spool/host-perfdata',
    require => Package['pnp4nagios'],
  }
}
