class User < ApplicationRecord
  
  #文字を全て小文字に変換
  before_save { self.email.downcase! }
  
  #空文字不可、５０文字まで
  validates :name, presence: true, length: { maximum: 50 } 
  #入力されるメールアドレスが正しい形式になっているかを判断、重複不可
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  #パスワードをより安全にする
  has_secure_password
  
end
