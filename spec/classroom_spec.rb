require 'spec_helper'

describe Classroom do
    let(:classroom) { Classroom.new('Music')}
    let(:student) { Student.new(22, 'Adarsh', true) }

    describe "#initialize" do
        it "sets the classroom label" do
            expect(classroom.label).to eql('Music')
        end

        it 'creates an empty array of students' do
            expect(classroom.students).to eq([])
          end
    end

end