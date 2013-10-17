class Link < ActiveRecord::Base
  attr_accessible :description, :title, :url, :submitter_id, :sub_ids
  validates :submitter_id, :title, :url, presence: true

  belongs_to :submitter, class_name: "User", foreign_key: :submitter_id

  has_many :link_subs
  has_many :subs, through: :link_subs
end
