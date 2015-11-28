class User < ActiveRecord::Base
  has_many :points, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :earned_badges, through: :groups

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
