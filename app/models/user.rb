require 'securerandom'
class User < ApplicationRecord
  before_create :add_api_key
  has_secure_password
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :email, uniqueness: true, presence: true
  validates :password, on: :create, presence: true
  private

  def add_api_key
    self.api_key = SecureRandom.uuid
  end
end
