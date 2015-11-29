class Category < ActiveRecord::Base

  has_many :categorizing, dependent: :nullify
  has_many :groups, through: :categorizing

  validates :title, presence: true
end
