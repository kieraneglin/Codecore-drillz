class Drill < ActiveRecord::Base
  belongs_to :group
  has_many   :solutions, dependent: :destroy
  accepts_nested_attributes_for :solutions, reject_if: :all_blank, allow_destroy: true
  has_many :user_drills, dependent: :destroy
  has_many :user, through: :user_drills

  validates :description, presence: true
end
