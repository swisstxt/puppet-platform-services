Facter.add("mpc_zone") do
  domain = Facter.value('domain')
  mpc_bu = domain[/(\w+)\.\w+\.\w+\.\w+\.\w+$/, 1]
  setcode do
    mpc_bu
  end
end
