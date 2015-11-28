class Group < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
<<<<<<< HEAD
  
  has_many :drills, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true
  validates :level, presence: true
=======

  
>>>>>>> aaron_drillz
end
