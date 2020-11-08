class User < ApplicationRecord
  has_secure_password
  has_many :tasks, dependent: :destroy
  has_many :records, dependent: :destroy
  validates_presence_of :email
  validates_uniqueness_of :email
end
