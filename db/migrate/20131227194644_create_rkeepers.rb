class CreateRkeepers < ActiveRecord::Migration
  def change
    create_table :rkeepers do |t|
      t.string  :code

      t.references :size, index: true
      t.references :dough, index: true
      t.references :sauce, index: true

      t.references :pizza, index: true
      t.references :products, index: true

      t.timestamps
    end
  end
end
