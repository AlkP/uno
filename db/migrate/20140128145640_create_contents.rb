class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer  :variants_id
      t.integer  :idd
      t.integer  :dough
      t.integer  :size
      t.integer  :sauce

      t.timestamps
    end
  end
end
