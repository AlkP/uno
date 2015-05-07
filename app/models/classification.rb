class Classification < ActiveRecord::Base
  has_many :pizza, dependent: :destroy
end
