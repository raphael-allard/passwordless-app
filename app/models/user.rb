class User < ApplicationRecord
  validates :email, :username, uniqueness: true, presence: true

  before_save :format_email_username

  def format_email_username
    self.email = self.email.delete(' ').downcase
    self.username = self.username.delete(' ').downcase
  end

  def self.find_user_by(value)
    where(["username = :value OR email = :value", {value: value}]).first
  end
end
