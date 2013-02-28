class platform_services_icinga::server::commands {
  nagios_command{
    'notify-host-by-sms':
      command_line => '/usr/local/bin/icinga_sms_agent.py $CONTACTPAGER$ "$NOTIFICATIONTYPE$: $HOSTNAME$ is $HOSTSTATE$ ($HOSTOUTPUT$)"';
    'notify-service-by-sms':
      command_line => '/usr/local/bin/icinga_sms_agent.py $CONTACTPAGER$ "$NOTIFICATIONTYPE$: $HOSTNAME$: $SERVICEDESC$ is $SERVICESTATE$ ($SERVICEOUTPUT$)"';
  }
}
