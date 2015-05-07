class AddNewColumnsToPizzerias < ActiveRecord::Migration
  def change
    change_table :pizzeria do |t|
      t.boolean     :redirect
      t.string      :redirect_email
      t.string      :waiting_time
    end
  end
end
