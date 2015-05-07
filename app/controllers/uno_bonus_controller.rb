class UnoBonusController < ApplicationController
  def index

  end
  def check
    db = Sequel.connect(:adapter=>'postgres', :host=>'gate.podvorye.ru', :database=>'delivery', :user=>'webq', :password=>'vfkfnjr')

    @resp = db.fetch("select * from card_credit(?);", params[:id_cart]).first[:card_credit] / 100.00

    respond_to do |format|
      format.js
    end
  end
end
