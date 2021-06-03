class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, length: { in: 2..20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

end
