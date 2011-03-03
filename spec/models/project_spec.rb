require 'spec_helper'

describe Project do
  it "should have many stories" do
    subject.should respond_to(:stories)
  end
  describe 'Project#create_or_update' do
    before do
      @pivotal_project = mock_model('TrackerProject', :current_velocity => 10)
      @pivotal_project.stub(:instance_values).and_return({:current_velocity => 10})
    end
    it "should create a new object if none exists" do
      Project.delete_all
      project = Project.create_or_update(@pivotal_project)
      project.should be_persisted
      Project.count.should == 1
    end
    it "should mass assign the pivotal project's attributes" do
      project = Project.create_or_update(@pivotal_project)
      project.current_velocity.should == @pivotal_project.current_velocity
    end
    it "should update an update of the same id" do
      a_project = Project.create_or_update(@pivotal_project)
      expect {
        same_project = Project.create_or_update(@pivotal_project)
      }.to change(Project, :count).by(0)
    end
  end
end
