class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string  :name
      t.string  :short_name

      t.timestamps
    end
  end
end
