class CreateSendforms < ActiveRecord::Migration
  def change
    create_table :sendforms do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
