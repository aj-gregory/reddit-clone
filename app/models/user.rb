require 'bcrypt'
class User < ActiveRecord::Base
  attr_accessible :name, :password
  attr_reader :password

  validates :name, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6 }, on: :create
  before_validation :generate_session_token, on: :create

  has_many :subs, foreign_key: :moderator_id

  def generate_session_token
    self.session_token = SecureRandom.urlsafe_base64(16)
  end

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end

  def self.find_by_credentials(name, password)
    user = User.find_by_name(name)
    return nil unless user

    user.is_password?(password) ? user : nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    generate_session_token
    self.save
    self.session_token
  end

end
