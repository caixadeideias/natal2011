require 'spec_helper'

describe Comment do
  
  context "validations" do
    
    it "should have a username" do
      subject.should have(1).errors_on(:username)
    end

    it "should have some content" do
      subject.should have(1).errors_on(:content)            
    end
  end
  
end
