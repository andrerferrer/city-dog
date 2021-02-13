class Venue < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :venuetags, dependent: :destroy
  has_many :tags, through: :venuetags

  CATEGORIES = ['cafe', 'restaurant', 'bar', 'park']
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
