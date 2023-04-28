require 'spec_helper'

describe Student do
  let(:student) { Student.new(17, 'Web Dev', 'Berkay', parent_permission: true)}

  it "sets the students age, classroom, name and parent_permission" do
    expect(student.age).to eql(17)
    expect(student.classroom).to eql('Web Dev')
    expect(student.name).to eql('Berkay')
    expect(student.parent_permission).to eql(true)
  end

  it "check student play_hooky" do
    expect(student.play_hooky).to eql('¯(ツ)/¯') 
  end

  it "check students classroom" do
    expect(student.classroom).to eql('Web Dev') 
  end
end
