class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(params[:comment])
    
    if @comment.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to comments_url }
  #     format.json { head :ok }
  #   end
  end
end
