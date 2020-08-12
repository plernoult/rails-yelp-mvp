class Restaurant < ApplicationRecord
  has_many :reviews
  CATEGORIES = %w(chinese italian japanese french belgian)
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :category
  validates :category, inclusion: { in: CATEGORIES }
end
