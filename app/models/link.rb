class Link < ActiveRecord::Base
  attr_accessible :description, :sub_id, :title, :url
  validates :sub_id, :title, :url, presence: true
end
