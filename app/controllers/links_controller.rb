class LinksController < ApplicationController
  before_filter :must_be_submitter, :only => [:edit, :update]

  def new
    render :new
  end

  def create
    @link = Link.new(params[:link])
    @link.submitter_id = current_user.id
    @link.sub_ids = params[:link][:sub_ids]

    if @link.save
      redirect_to sub_url(@link.subs.last)
    else
      flash[:errors] = @link.errors.full_messages
      redirect_to sub_url(@link.subs.last)
    end
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    @link = Link.find(params[:id])

    if @link.update_attributes(params[:link])
      redirect_to @link
    else
      flash[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def show
    @link = Link.find(params[:id])
    render :show
  end

  def index
  end

  def destroy
  end
end
