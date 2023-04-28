require 'spec_helper'

describe Trimmer do
  let(:person) { Person.new(18, 'John Doe') }
  let(:decorator) { Trimmer.new(person) }
  it 'should return a trimmed version of name' do
    person.name = 'This is a very long name'
    expect(decorator.correct_name).to eq('This is a ')
  end
end
