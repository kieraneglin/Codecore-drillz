class Category < ActiveRecord::Base

  has_many :categorizings, dependent: :nullify
  has_many :groups, through: :categorizings

  validates :title, presence: true

  
end
