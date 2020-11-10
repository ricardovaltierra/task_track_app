class Task < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :description, presence: true
  validates :completion, presence: true
  validates :user_id, presence: true
end
