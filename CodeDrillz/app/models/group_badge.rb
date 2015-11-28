class GroupBadge < ActiveRecord::Base
  belongs_to :group
  belongs_to :badge
end
