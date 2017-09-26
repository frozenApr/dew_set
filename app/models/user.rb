class User < ApplicationRecord
  has_secure_password

  validates :nick_name, :phone_number, :gender, :place, presence: true
  validates :password, confirmation: true
  validates :nick_name, length: { maximum: 8 }
  validates :nick_name, uniqueness: true

  has_many :photos
  has_many :posts
  has_many :comments
  has_many :makeups

  before_create :create_remember_token

  action_store :like, :photo, counter_cache: true
  action_store :star, :photo, counter_cache: true, user_counter_cache: true
  action_store :follow, :user, counter_cache: 'followers_count', user_counter_cache: 'following_count'

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
