class platform_services_vmware::redhat (
  $tools_used  = 'open',
  $esx_version = 'latest',
) {
  if $::virtual == 'vmware' {
    if $tools_used != 'open' {

      package { 'open-vm-tools':
        ensure => absent,
      } ->
      yum::repo{'vmware-tools':
        descr    => 'VMware Tools',
        baseurl  => "http://packages.vmware.com/tools/esx/${esx_version}/rhel${::lsbmajdistrelease}/${::architecture}",
        enabled  => 1,
        priority => 1,
        gpgcheck => 0,
      } ->
      package { 'vmware-tools-esx-nox':
        ensure => latest,
      }
    # default: install open-vm-tools
    } else {
      package { 'vmware-tools-esx-nox':
        ensure => absent,
      } ->
      package { 'open-vm-tools':
        ensure => latest,
      } ~>
      service { 'vmtoolsd':
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
      }
    }
  }
}
