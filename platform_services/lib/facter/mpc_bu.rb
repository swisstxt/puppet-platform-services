Facter.add("mpc_bu") do
  setcode do
    domain = Facter.value('domain')
    mpc_bu = domain[/(\w+\.)?\w+\.\w+\.(\w+)\.\w+$/, 2]
    if mpc_bu
      mpc_bu
    else
      'undef'
    end
  end
end
