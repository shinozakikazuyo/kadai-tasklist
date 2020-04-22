class Task < ApplicationRecord
  validates :status, presence: true, length: { maximum: 10 }
  #validates :user, presence: true, length: { maximum: 50 }
end
