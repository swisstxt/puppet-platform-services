Facter.add("mpc_zone") do
  setcode do
    case Facter.value('availability_zone')
    when 'ZUERICH_IX'
      'zrh'
    when 'BIEL_CU01'
      'bie'
    else
      'undef'
    end
  end
end
