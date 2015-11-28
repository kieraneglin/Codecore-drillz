class Group < ActiveRecord::Base

  belongs_to :category
  belongs_to :user

  has_many :drills, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :group_badges, dependent: :nullify
  has_many :badges, through: :group_badges
  has_many :earned_badges, dependent: :nullify

  validates :name, presence: true
  validates :level, presence: true
end
