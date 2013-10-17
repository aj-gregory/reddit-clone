class SubsController < ApplicationController
  before_filter :require_moderator, :only => :edit

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(params[:sub])
    @sub.moderator_id = current_user.id

    if @sub.save
      link_params = []
      params[:links].values.map do |val|
        val[:submitter_id] = current_user.id
        link_params << val
      end

      @sub.links.create(link_params)
      redirect_to users_url
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update_attributes(params[:sub])
      params[:link][:submitter_id] = current_user.id
      @sub.links.create(params[:link])
      redirect_to @sub
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def destroy

  end

  def index

  end
end
