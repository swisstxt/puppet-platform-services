Facter.add("mpc_zone") do
  domain = Facter.value('domain')
  mpc_zone = domain[/(\w+)(\.\w+)*$/, 1]
  setcode do
    mpc_zone
  end
end
