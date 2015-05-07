class CreatePizzeria < ActiveRecord::Migration
  def change
    create_table :pizzeria do |t|
      t.string  :name
      t.boolean :work
      t.string  :email
      t.string  :address

      t.timestamps
    end
  end
end
