class Editor < ApplicationRecord

  validates :email, presence: true, length: {minimum: 10}
  validates :password, presence: true, length: {minimum: 6}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, :dependent => :destroy

end