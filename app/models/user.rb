class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname , presence: true
          # 他のバリデーションルールも含めるか、必要に応じて追加してください
  validates :email, presence: true, uniqueness: true
          # 他のバリデーションルールも含めるか、必要に応じて追加してください
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true      
  validates :birth_date, presence: true
  #has_many[ハズメニー、多数持っている]
  has_many :items
  has_many :orders
end









