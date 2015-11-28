class User < ActiveRecord::Base
  has_many :points, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
