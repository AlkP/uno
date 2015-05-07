class AddModifiersToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.boolean :has_modifiers
      t.boolean :modifier
      t.integer :modifier_id
    end
  end
end
