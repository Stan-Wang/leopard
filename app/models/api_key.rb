class ApiKey < ApplicationRecord
  before_create :generate_access_token
  before_create :set_expiration
  belongs_to :user

  def expired?
    DateTime.now >= self.expires_at
  end

  def self.clean_history_tokens(uid)
    ApiKey.where(user_id: uid).delete_all
  end

  private
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end

  # token 有效期  单位 = 天
  def set_expiration
    self.expires_at = DateTime.now + 30
  end
end
