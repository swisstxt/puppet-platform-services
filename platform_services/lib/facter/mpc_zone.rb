Facter.add("mpc_zone") do
  setcode do
    interfaces = Facter.value('interfaces').split(',')
    # Ignore well known local interfaces
    excluded_if = ['lo', 'docker.*', 'lxdbr.*', 'virbr.*', 'veth.*' ]
    excluded_if.each do |ifpattern|
      interfaces.delete_if { |x| x.match(ifpattern) }
    end
    # Iterate remaining interfaces until the zone is defined
    zone = 'undef'
    interfaces.each do |ifname|
      ip = Facter.value("ipaddress_#{ifname}")
      unless ip.nil?
        case ip[/^\d+\.(\d+)\.\d+\.\d+$/, 1]
        when '101'
          zone = 'bie'
        when '102'
          zone = 'zrh'
        end
      end
      unless zone == 'undef'
        break
      end
    end
    zone
  end
end
