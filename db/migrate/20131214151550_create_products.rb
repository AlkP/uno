class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.string  :category
      t.text    :description
      t.string  :short_description
      t.integer :how_many
      t.string  :name1
      t.float   :price1
      t.string  :name2
      t.float   :price2
      t.string  :name3
      t.float   :price3

      t.timestamps
    end
  end


end
