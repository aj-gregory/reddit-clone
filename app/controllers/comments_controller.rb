class CommentsController < ApplicationController
  def new
    @link = Link.find(params[:link_id])
    render :new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.commenter_id = current_user.id
    @comment.link_id = params[:link_id]

    if @comment.save
      redirect_to link_url(@comment.link_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to link_url(@comment.link_id)
    end
  end
end
