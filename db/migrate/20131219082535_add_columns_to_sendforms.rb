class AddColumnsToSendforms < ActiveRecord::Migration
  def change
    change_table :sendforms do |t|
      t.boolean :delayed #отсроченная доставка
      t.string  :town     #город
      t.string  :street   #город
      t.string  :house    #дом
      t.string  :housing  #корпус
      t.string  :apartment#квартира
      t.text    :description#описание

    end
  end
end
