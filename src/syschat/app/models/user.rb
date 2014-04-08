class User < ActiveRecord::Base

  validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = find_by_email(email)
    #if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    #  user
    #else
    #  nil
    #end
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
