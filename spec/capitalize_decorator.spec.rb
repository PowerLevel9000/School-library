require 'spec_helper'

describe Capitalize do
  let(:name) { Name.new('burak') }
  it 'return capitalize nameable' do
    expect(correct_name(name)).to eq('BURAK')
  end
end
