class platform_services::base::redhat {
  service{[
     'cups',
     'dbus',
  ]:
    ensure => stopped,
    enable => false,
  }
  if $lsbmajdistrelease == 5 {
    service{[
      'avahi',
      'acpid',
      'hal',
      'kudzu',
      'readahead',
      'lvm',
      'nfs',
    ]:
      ensure => stopped,
      enable => false,
    }
  }
  include ::platform_services_yum
  include ::platform_services_network
  include ::platform_services_firewall
  include ::platform_services_firewall::ssh
  include ::platform_services_authconfig
  include ::platform_services_vmware::redhat

  if hiera('platform_services_ssh::server::enable', false) {
    include ::platform_services_ssh::server
  }

  include platform_services_rsyslog
  include platform_services_selinux
}
