Facter.add('node_role') do
  setcode do
    Facter.value('hostname')[/^(\w+)/, 1]
  end
end
