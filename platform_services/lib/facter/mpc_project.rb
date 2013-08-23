Facter.add("mpc_project") do
  setcode do
    domain = Facter.value('domain')
    mpc_project = domain[/(\w+\.\w+\.)?(\w+)\.\w+\.\w+$/, 2]
    if mpc_project
      mpc_project
    else
      'undef'
    end
  end
end