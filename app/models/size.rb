class Size < ActiveRecord::Base
  has_many :price, dependent: :destroy
  has_many :rkeeper, dependent: :destroy
  validates :name, presence: true

end
