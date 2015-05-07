class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.float  :price

      t.references :size, index: true

      t.references :pizza, index: true
      t.references :products, index: true

      t.timestamps
    end
  end
end
