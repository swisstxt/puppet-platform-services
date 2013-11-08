module Puppet::Parser::Functions
  newfunction(:baseip, :type => :rvalue) do |args|
    ip=lookupvar('ipaddress')
    netmask=lookupvar('netmask')
    baseip=""
    addr_parts = ip.split('.')
    mask_parts = netmask.split('.')
    addr_parts.zip((0..addr_parts.size).to_a).map do |n,i|
      baseip += (n.to_i & mask_parts[i].to_i).to_s + "."
    end
    baseip[0..-2]
  end
end