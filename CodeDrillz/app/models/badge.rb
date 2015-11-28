class Badge < ActiveRecord::Base
  has_many :earned_badges, through: :groups
end
