class Solution < ActiveRecord::Base
  belongs_to :drill

  validates :correct_answer, presence: true
  validates :type, presenece: true
end