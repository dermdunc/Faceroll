require 'spec_helper'

describe Timeline do
  context "#{updates}" do
    it "returns all the updates for all the user ids" do
      user = Factory(:user)
      update = user.updates.create(content: Factory(:post))
      timeline = Timeline.new([user.id])
      timeline.updates.should == [update]
    end
    
    it "gets the updates in the correct order" do
      user = Factory(:user)
      first_update = user.updates.create(created_at: 10.minute.ago, content: Factory(:post))
      second_update = user.updates.create(created_at: 1.minute.ago, content: Factory(:post))
      timeline = Timeline.new([user.id])
      timeline.updates.should == [second_update, first_update]
    end
    
    it "doesn't include updates from user ids we don't pass in" do
      user = Factory(:user)
      update = user.updates.create(content: Factory(:post))
      timeline = Timeline.new([])
      timeline.updates.should == []
    end
  end
end