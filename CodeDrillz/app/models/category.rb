class Category < ActiveRecord::Base
<<<<<<< HEAD
  has_many :groups, dependent: :nullify
=======
  
>>>>>>> aaron_drillz

  validates :title, presence: true
end
