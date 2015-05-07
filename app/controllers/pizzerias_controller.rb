class PizzeriasController < ApplicationController
  before_filter :admin_manager?
  def index
    @pizzerias = Pizzeria.all
  end
  def show
    @pizzeria = Pizzeria.find(params[:id])
    @coordinates = Coordinate.where('pizzeria_id = ?', params[:id]).order('id ASC')
  end
  def update
    azimut = params[:azimut] ? params[:azimut][:arr] : ""
    if azimut.length != 0
      id_coordinate = params[:id]
      Coordinate.where('pizzeria_id = ?', id_coordinate).destroy_all
      azimut.split(" ").each do |f|
        longitude = f.split(",").first
        latitude = f.split(",").last
        Coordinate.create(pizzeria_id:id_coordinate,longitude:longitude,latitude:latitude);
      end
    end
    pizzeria = Pizzeria.find(params[:id])
    if pizzeria.update(pizzerias_params)
      if current_user.admin?
        redirect_to pizzerias_path
      else
        redirect_to root_path
      end
    else
      render 'edit'
    end
  end
  private
  def pizzerias_params
    params.require(:pizzeria).permit(:name,:work,:address,:email,:redirect,:redirect_email,:waiting_time)
  end
end
