require 'spec_helper'

describe Action do

  before(:each)do
    @user=Factory(:user)

  end
  
  it "should create a new instance given valid attributes" do
    @user.actions.create!(@attr)
  end
  
  describe "user associations" do
    
    before(:each)do
      @action=@user.actions.create(@attr)
    end
  
    it "should have a user attribute" do
      @action.should respond_to(:user)
    end
  
    it "should have the right associated user" do
      @action.user_id.should == @user.id
      @action.user.should == @user
    end
  
  end

  describe "trigger associations" do
  
    it "should have a trigger attribute" do
      @action.should respond_to(:trigger)
    end

    it "should have the right associated trigger" do
      @trigger.action_id.should == @action.id
      @trigger.action.should == @action
    end


  end

  describe "publisher associations" do
  
    it "should have a publisher attribute" do
      @action.should respond_to(:publisher)
    end

    it "should have the right associated publisher" do
      @publisher.action_id.should == @action.id
      @publisher.action.should == @action
    end

  end

end
