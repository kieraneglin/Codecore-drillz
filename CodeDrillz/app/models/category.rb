class Category < ActiveRecord::Base
  has_many :groups, dependent: :nullify
  validates :title, presence: true
end
