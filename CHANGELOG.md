# Changelog

## Version 1.0.2 (pending)

### Fixes
* selinux: set absent /selinux/enforce.
* icinga: ignore making a link to /var/icinga if directory exists.

## Version 1.0.1

### Fixes
* graylog2: fixed ldap can not be configured propperly.
* network: do not touch network config if system is physical.

## Version 1.0.0

### Modules

#### New
* selinux

#### Fixes
* platform_services_haproxy::member fixed typo in port forwardings


#### Changes

* dns concept changed: 
** 2nd nameservers are ns3.swisstxt.ch and ns4.swisstxt.ch
** default resolv conf will be (also as delivered in dhcp) cs-router, ns3.swisstxt.ch and ns4.swisstxt.ch
** soa record changed to e.g. dns-bie-01.bie.prod.rts.mpc so without "serv"

* selinux: enabled for in base::redhat in default mode permissive. Can be configured in hiera.
* Removed platform_services_resolvconf from base. resolv.conf is now managed by dhcp only which fixes a race condition between pupppet and dhcp.

## Version 0.9.0

### Modules

#### New

* ssh
* ntp
* rsyslog
* keepalived

#### Updated
* icinga
* graylog2
* cloudstack
* dns
* mongodb
* ruby
* php
* pakiti

### Fixes
* Tempaltes: fix variable lookups without @-prefix
* Network: fixes for custom network support
* fix mpc_network_front fact for new srf networks

### Misc changes
* platform_dns: use hostname for soa and ns entries
* move alle submodules to either bitbucket or github
* use https protocol for all submodules
* platform_services_dns: add suport for networks other than /24
* platform_services_dns::server: make interfaces parameterizable
* make platform_services::dns debian compatible
* disable management of front_ips via class param ::platform_services::manage_front_ips

* refactor wording of vip into front_ip across the codebase

Simple migration steps: if you encounter any occurance of 'vip'
in your own codebase, simply replace it with 'front_ip'.

* remove legacy facts project and region
* make $vip-mappings a class parameter
* ensure createrepo package is present
* include yum in pre stage
* include yum repo server only for redhat based systems
* remote puppetmaster from must-provide top-scope variables
* configure pre stage in platform_services

Users of the platform-services-skeleton must remove the "stage{'pre':"
and "class{'yum':" declarations from manifests/settings.pp.

* don't use disabled::service helper
* make platform_services::base debian compatible
* remove uneeded/unused submodule

## Version 0.1.0

* Changes to the Icinga module which allow an automatic installation, configuration and update of the Icinga monitoring servers.
