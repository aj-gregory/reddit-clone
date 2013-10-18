class Link < ActiveRecord::Base
  attr_accessible :description, :title, :url, :submitter_id, :sub_ids
  validates :submitter_id, :title, :url, presence: true

  belongs_to :submitter, class_name: "User", foreign_key: :submitter_id

  has_many :link_subs
  has_many :subs, through: :link_subs
  has_many :comments
  has_many :votes, :class_name => "LinkVote"
  has_many :voters, :through => :votes

  def comments_by_parent_id
    comment_hash = Hash.new([])
    comment_list = self.comments

    comment_list.each do |comment|
      if comment.parent_comment_id == nil
        comment_hash[nil] += [comment]
      end
      comment_hash[comment.id] = comment_list.where("parent_comment_id = ?", comment.id)
    end
    comment_hash
  end

end
