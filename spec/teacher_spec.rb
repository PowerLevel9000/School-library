require 'spec_helper'

describe Teacher do

    let(:teacher) { Teacher.new(33, 'Philosophy', 'Burak', parent_permission: true)}


describe "#initialize" do
    it "sets the teacher age, speciliziation, name and parent_permission" do
        expect(teacher.age).to eql(33)
        expect(teacher.specialization).to eql('Philosophy')
        expect(teacher.name).to eql('Burak')
        expect(teacher.parent_permission).to eql(true)
    end
end

end