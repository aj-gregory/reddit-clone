class LinkVote < ActiveRecord::Base
  attr_accessible :link_id, :vote, :voter_id

  validates :link_id, :vote, :voter_id, :presence => true

  belongs_to :voter, :class_name => "User"

  belongs_to :link
end
