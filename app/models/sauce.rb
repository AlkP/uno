class Sauce < ActiveRecord::Base
  has_many :rkeeper, dependent: :destroy
  validates :name, presence: true

end
