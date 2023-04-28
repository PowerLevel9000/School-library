require 'spec_helper'

describe Nameable do
    let(:nameable) { Nameable.new() }
    it "it should have a raise since no name there" do
        expect(nameable.correct_name)to raise_error(NotImplementedError)
    end
end