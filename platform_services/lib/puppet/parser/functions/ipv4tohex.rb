require 'ipaddr'
module Puppet::Parser::Functions
  newfunction(:ipv4tohex, :type => :rvalue) do |args|
    ipAddr = IPAddr.new(args[0])
    raise ArgumentError, 'Argument is not a valid IPv4' unless ipAddr.ipv4?()

    IPv4hex = ""
    ipAddr.to_string.split(/\./).each do |ipv4_part|
      IPv4hex << String(sprintf("%02X",Integer(ipv4_part)))
    end

    ### NOTE: To convert an hex into an IPv4, you can use:
    ### IPv4 = IPv4hex.scan(/../).map{|i|i.hex}*"."

    IPv4hex
  end
end