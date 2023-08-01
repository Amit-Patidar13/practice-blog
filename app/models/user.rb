class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  enum role: { admin: 0, writer: 1 }

  has_many :posts
  has_many :comments
  has_many :likes

  def self.ransackable_attributes(auth_object = nil)
    ["email", "name"  ]
  end
end
