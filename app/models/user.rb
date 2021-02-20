class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :venues, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  SIZES = ['small', 'med-small', 'medium', 'med-large', 'large']
  validates :dog_name, presence: true
  validates :owner_name, presence: true
  # validating the size causes the Devise signup to fail
  validates :size, inclusion: { in: SIZES }
end
