require 'spec_helper'

describe Classroom do
  let(:classroom1) { Classroom.new('Music')}
  let(:student1) { Student.new(22, 'Adarsh', true) }
  let(:classroom2) { Classroom.new('Maths')}
  let(:student2) { Student.new(22, 'Burak', true) }


  it "sets the classroom label" do
      expect(classroom1.label).to eql('Music')
  end
  it "sets the classroom label" do
      expect(classroom2.label).to eql('Maths')
  end

  it 'creates an empty array of students' do
      expect(classroom.students).to eq([])
  end

  if 'classroom1 should have student 1 student ' do
      classroom1.add_student(student1)
      expect(classroom1.students.length).to eq(1)
  end
end