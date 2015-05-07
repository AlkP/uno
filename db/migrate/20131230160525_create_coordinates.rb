class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.references  :pizzeria, index: true
      t.float       :longitude
      t.float       :latitude

      t.timestamps
    end
  end
end
