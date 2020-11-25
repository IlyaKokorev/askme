require 'openssl'

class User < ApplicationRecord
  attr_accessor :password

  ITERATIONS = 2000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions

  validates :password, confirmation: true

  before_validation :downcase_email
  validates :email, :username, :password, presence: true
  validates :email, :username, uniqueness: true
  validates :email, format: { with: /@/ }

  before_validation :downcase_username
  validates :username, length: { minimum: 3, maximum: 40 }
  validates :username, format: { with: /\A[a-zA-Z0-9_]+\z/ }

  before_save :encrypt_password

  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
          OpenSSL::PKCS5.pbkdf2_hmac(
              password, password_salt, ITERATIONS, DIGEST.length, DIGEST
          )
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end

  private

  def downcase_username
    self.username = username.downcase if username.present?
  end

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
