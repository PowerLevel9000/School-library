require 'spec_helper'

describe Decorator do
  let(:decorator) { Decorator.new('burak otman') }
  it 'sets the decorator nameable as Burak Otman' do
    expect(decorator.nameable).to eql('burak otman')
  end

  it 'check correct_name shows nameable' do
    expect(decorator.correct_name).to eql('burak otman')
  end
end
