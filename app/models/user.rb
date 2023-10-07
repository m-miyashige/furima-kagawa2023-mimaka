class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname , presence: true
          # 他のバリデーションルールも含めるか、必要に応じて追加してください
          # パスワードの半角英数混合を検証するバリデーションを追加
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "is invalid. Include both letters and numbers" }        
  validates :last_name, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid' }      
  validates :birth_date, presence: true
  #has_many[ハズメニー、多数持っている]
  has_many :items
  has_many :orders
end









