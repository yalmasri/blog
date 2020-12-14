class AccessToken < ApplicationRecord
  belongs_to :owner, polymorphic: true, inverse_of: :access_tokens

  before_create :set_token
  before_create :set_expires_in

  private

  def set_token
    loop do
      self.token = SecureRandom.base64(64)
      break unless self.class.exists?(token: token)
    end
  end

  def set_expires_in
    self.expires_in = Time.zone.now + 1.week
  end
end
