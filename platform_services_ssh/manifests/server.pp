class platform_services_ssh::server (
  $config = 'sshd_config.erb'
) {
  class {'::ssh::server':
    config => $config,
  }
}
