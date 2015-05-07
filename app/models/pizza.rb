class Pizza < ActiveRecord::Base
  belongs_to :classification
  has_many :price, dependent: :destroy
  has_many :rkeeper, dependent: :destroy
  has_attached_file :view_products,
                    :default_url => '/assets/no-photo.png',
                    :styles => { :original => "800x600!", :small => "268x198!" },
                    :default_style => :small,
                    :convert_options => {
                      :all => "-quality 85 -strip" }
end
