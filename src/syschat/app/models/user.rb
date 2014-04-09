require 'bcrypt'

class User < ActiveRecord::Base

  validates_presence_of :email
  validates_uniqueness_of :email
  #validates_presence_of :password, :on => :create -- no password on google signin...
  before_save :encrypt_password
  

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.authenticate(password)
        user
    else
      nil
    end
  end

  def authenticate(password)
    if password_salt.nil?
      password.empty?
    else      
      BCrypt::Engine.hash_secret(password, password_salt)
    end
  end


  def encrypt_password
    if defined?(password) && password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
