class AddFileColumnsToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :view_products
    end
  end
  def self.down
    remove_attachment :products, :view_products
  end
end
