class Solution < ActiveRecord::Base
  belongs_to :drill

  validates :correct_answer, presence: true
  validates :solution_type, presence: true
end
