class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.boolean  :pizza
      t.integer  :products_id

      t.timestamps
    end
  end
end
