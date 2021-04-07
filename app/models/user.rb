class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :nickname, presence: true
  validates :birth_date, presence: true

  validates :password, format: { with: VALID_PASSWORD_REGEX }

  with_options presence: true, format: { with: VALID_NAME_REGEX } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: VALID_NAME_KANA_REGEX } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
