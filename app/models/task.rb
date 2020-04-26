class Task < ApplicationRecord
  #ユーザーに対し１対多とする、ユーザの紐付け無しでは投稿できない
  belongs_to :user
  
  #バリデーション
  validates :status, presence: true, length: { maximum: 10 }
  #validates :user, presence: true, length: { maximum: 50 }
end
