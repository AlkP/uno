class Products < ActiveRecord::Base
  has_many :price, dependent: :destroy
  has_many :rkeeper, dependent: :destroy
  has_attached_file :view_products,
                    :default_url => '/assets/no-photo.png',
                    :styles => { :original => "800x600!", :small => "268x198!" },
                    :default_style => :small,
                    :convert_options => {
                      :all => "-quality 85 -strip" }

  #validates :rkeeper1, format: {with: /\A[0-9]+\z/}
  #validates :rkeeper2, format: {with: /\A[0-9]+\z/}
  #validates :rkeeper3, format: {with: /\A[0-9]+\z/}

  def self.get id, size
    case size
      when "1"
        find(id).rkeeper1
      when "2"
        find(id).rkeeper2
      when "3"
        find(id).rkeeper3
    end
  end
end
