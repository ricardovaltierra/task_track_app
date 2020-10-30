class Task < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :completion, presence: true, uniqueness: true
  validates :completion, :user_id, presence: true
end
