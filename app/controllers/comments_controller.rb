class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(params[:comment])
    @comments = Comment.all # => not cool this to be here...
      
    respond_to do |format| 
      if @comment.save
        format.html { redirect_to root_path }
        format.js { render "create.js.erb" }
      else
        format.html { render :index }
        format.js { render "create.js.erb" }
      end
    end
  end

  # def destroy
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy
  #
  #   respond_with @comment
  # end
end
