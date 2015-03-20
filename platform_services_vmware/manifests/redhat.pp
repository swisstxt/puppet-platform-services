class platform_services_vmware::redhat (
  $tools_used  = 'open',
  $esx_version = 'latest',
) {
  if $::virtual == 'vmware' {
    if $tools_used != 'open' {

      package { 'open-vm-tools':
        ensure => absent,
      } ->
      package { 'vmware-tools-esx-nox':
        ensure => latest,
      }
    # default: install open-vm-tools
    } else {
      package { [
        'vmware-tools-core',
        'vmware-tools-esx-nox',
        'vmware-tools-foundation',
        ]:
        ensure => purged,
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
