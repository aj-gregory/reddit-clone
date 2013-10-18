class Comment < ActiveRecord::Base
  attr_accessible :body, :commenter_id, :link_id, :parent_comment_id
  validates :body, :commenter_id, :link_id, presence: true

  belongs_to :commenter, class_name: "User"
  belongs_to :link

  belongs_to :parent_comment, class_name: "Comment"
  has_many :child_comments, class_name: "Comment", foreign_key: :parent_comment_id
end
