class Record < ApplicationRecord
  belongs_to :user
  belongs_to :task
  validates :percentage, presence: true
end
