require 'spec_helper'

describe Story do
  it 'should return the first label if one is present' do
    subject.labels = 'a,b'
    subject.first_label.should == 'a'
  end
  it 'should return the word none if no label is present' do
    subject.labels = nil
    subject.first_label.should == 'none'
  end
end
