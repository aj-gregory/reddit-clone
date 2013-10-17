class SubsController < ApplicationController
  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(params[:sub])
    @sub.moderator_id = current_user.id

    if @sub.save
      @sub.links.create(params[:links].values)
      redirect_to users_url
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy

  end

  def index

  end
end
