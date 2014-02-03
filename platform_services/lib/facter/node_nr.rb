Facter.add('node_role') do
  setcode do
    Facter.value('hostname')[/\d+$/]
  end
end
