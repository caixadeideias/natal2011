require 'spec_helper'

describe CommentsController do
  
  def valid_attributes
    { 
      :username => "Fulano",
      :content => "Fulano disse alguma coisa"
    }
  end
  
  describe "GET index" do
    
    it "should instantiate a new comment" do      
      Comment.should_receive(:new).once
      get :index
    end
    
    it "should return all comments" do      
      Comment.should_receive(:all).once
      get :index
    end
    
  end
  
  describe "POST create" do
    
    # In order to not get a nil error, need to assign @comments as Comment.all here too    
    it "@comments should not be nil" do
      post :create, :comment => valid_attributes
      assigns(:comments).should_not be_nil
    end
    
    context "when valid" do
            
      it "assigns the comment as @comment" do
        post :create, :comment => valid_attributes
        assigns(:comment).should be_a(Comment)
      end
      
      it "persists the new Comment" do
        expect {
          post :create, :comment => valid_attributes
        }.to change(Comment, :count).by(1)
      end
            
      it "should redirect to the root path" do
        post :create, :comment => valid_attributes
        response.should redirect_to(root_path)
      end
      
    end
    
    context "when not valid" do
      
      it "should not persist the new Comment" do
        expect {
          post :create, :comment => {}
        }.to_not change(Comment, :count)
      end
      
      it "should render the new template" do
        post :create, :comment => {}
        response.should render_template(:index)
      end
       
    end
    
  end

end
