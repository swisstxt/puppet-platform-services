Facter.add("mpc_role") do
  hostname = String.new(Facter.value('hostname'))
  mpc_role = hostname.sub(/-[0-9]+$/, '')
  setcode do
    if mpc_role.nil?
      hostname
    else
      mpc_role
    end
  end
end
