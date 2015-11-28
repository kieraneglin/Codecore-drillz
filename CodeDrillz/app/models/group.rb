class Group < ActiveRecord::Base


  has_many :drills, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true
  validates :level, presence: true

end
