require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 2000
  DIGEST = OpenSSL::Digest::SHA256.new

  attr_accessor :password

  has_many :questions, dependent: :destroy

  validates :password, confirmation: true
  validates :password, presence: true, on: :create
  validates :email, :username, presence: true, uniqueness: true
  validates :email, format: { with: /\A.+@.+\z/ }
  validates :username, length: { minimum: 3, maximum: 40 }, format: { with: /\A[a-zA-Z0-9_]+\z/ }
  validates :background_color, format: { with: /\A#?([a-f0-9]{6}|[a-f0-9]{3})\z/ }

  before_validation :downcase_user_text, :user_color
  before_save :encrypt_password

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    email&.downcase!
    user = find_by(email: email)

    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end

  private

  def downcase_user_text
    username&.downcase!
    email&.downcase!
  end

  def user_color
    self.background_color = '#005a55' if background_color == nil
  end

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
end
