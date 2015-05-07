class AddWeightToClassification < ActiveRecord::Migration
  def change
    change_table :classifications do |t|
      t.integer :weight
    end
  end
end
