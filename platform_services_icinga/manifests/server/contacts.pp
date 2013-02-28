class platform_services_icinga::server::contacts inherits icinga::defaults::contacts {
  Nagios_contact['root']{
    ensure => absent,
  }
  define site-icinga::contacts::site(
    $email,
    $mobile
  ) {
    nagios_contact{
      "${name}_work":
        use => 'generic-contact',
        service_notification_period => 'workhours',
        host_notification_period => 'workhours',
        email => $email,
        pager => $mobile;
      "${name}_free":
        use => 'generic-contact',
        service_notification_period => 'nonworkhours',
        host_notification_period => 'nonworkhours',
        service_notification_commands => 'notify-service-by-email,notify-service-by-sms',
        host_notification_commands => 'notify-host-by-email,notify-host-by-sms',
        email => $email,
        pager => $mobile;
    }
  }
  site-icinga::contacts::site{
    'franziska.muster':
      email => 'franziska.muster@example.com',
      mobile => '0790000000';
    'hans.muster':
      email => 'hans.muster@example.com',
      mobile => '0790000000';
  }
}
