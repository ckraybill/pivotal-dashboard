require 'spec_helper'

describe Project do
  it 'should have many stories' do
    subject.should respond_to(:stories)
  end
end
