class Sub < ActiveRecord::Base
  attr_accessible :moderator_id, :name
  validates :moderator_id, :name, presence: true

  belongs_to :moderator, foreign_key: :moderator_id, class_name: "User"
  has_many :links
end
