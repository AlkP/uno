class CreateSauces < ActiveRecord::Migration
  def change
    create_table :sauces do |t|
      t.string  :name
      t.string  :short_name

      t.timestamps
    end
  end
end
