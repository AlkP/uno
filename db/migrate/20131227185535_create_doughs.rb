class CreateDoughs < ActiveRecord::Migration
  def change
    create_table :doughs do |t|
      t.string  :name
      t.string  :short_name

      t.timestamps
    end
  end
end