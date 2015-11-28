class Drill < ActiveRecord::Base
  belongs_to :group
  has_many   :solutions

  validates :description, presence: true
end
