# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_authentic do |c|
    c.crypto_provider = ::Authlogic::CryptoProviders::SCrypt
  end

  has_many :pages, dependent: :destroy

  validates :email,
            uniqueness: { case_sensitive: false, if: :will_save_change_to_email? },
            email: true

  validates :password, confirmation: true, password: true
  validates :password_confirmation, presence: true, password: true, if: :password
end
