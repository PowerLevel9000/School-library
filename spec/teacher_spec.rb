require 'spec_helper'

describe Teacher do
  let(:teacher) { Teacher.new(33, 'Philosophy', 'Burak', parent_permission: true) }

  it 'sets the teacher age, speciliziation, name and parent_permission' do
    expect(teacher.age).to eql(33)
    expect(teacher.specialization).to eql('Philosophy')
    expect(teacher.name).to eql('Burak')
    expect(teacher.parent_permission).to eql(true)
  end

  it 'check teacher can use service?' do
    expect(teacher.can_use_services?).to eql(true)
  end
end
