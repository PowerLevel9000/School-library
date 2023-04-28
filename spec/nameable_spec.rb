require 'spec_helper'

describe Nameable do
  let(:nameable) { Nameable.new }
  let(:person) { Person.new(33, 'Burak', parent_permission: false) }
  it 'it should return correct name ' do
    expect(person.correct_name).to eq('Burak')
  end
end
