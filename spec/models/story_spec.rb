require 'spec_helper'

describe Story do
  it "should belong to a project" do
    subject.should respond_to(:project)
  end
  it "should return the first label if one is present" do
    subject.labels = 'a,b'
    subject.first_label.should == 'a'
  end
  it "should return the word none if no label is present" do
    subject.labels = nil
    subject.first_label.should == 'none'
  end
  describe 'Story#create_or_update' do
    before do
      @pivotal_story = mock_model('TrackerStory', :estimate => 2)
      @pivotal_story.stub!(:instance_values).and_return({:estimate => 2})
    end
    it "should create a new object if none exists" do
      Story.delete_all
      story = Story.create_or_update(@pivotal_story)
      story.should be_persisted
      Story.count.should == 1
    end
    it "should mass assign the pivotal story's attributes" do
      story = Story.create_or_update(@pivotal_story)
      story.estimate.should == @pivotal_story.estimate
    end
    it "should update an object of the same id" do
      a_story = Story.create_or_update(@pivotal_story)
      expect {
        same_story = Story.create_or_update(@pivotal_story)
      }.to change(Story, :count).by(0)
    end
  end
end
