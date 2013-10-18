class LinkVotesController < ApplicationController
  def upvote
    @link = Link.find(params[:id])
    if @link.voters.include?(current_user)
      update = @link.votes.where('voter_id = ?', current_user.id).first
      update.vote = 1
      update.save
      redirect_to @link
    else
      @link.votes.create(link_id: @link.id, voter_id: current_user.id, vote: 1)
      redirect_to @link
    end
  end

  def downvote
    @link = Link.find(params[:id])
    if @link.voters.include?(current_user)
      update = @link.votes.where('voter_id = ?', current_user.id).first
      update.vote = -1
      update.save
      redirect_to @link
    else
      @link.votes.create(link_id: @link.id, voter_id: current_user.id, vote: -1)
      redirect_to @link
    end
  end
end
