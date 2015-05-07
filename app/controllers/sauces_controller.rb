class SaucesController < ApplicationController
  before_filter :admin?
  def index
    @sauces = Sauce.all
  end
  def new
    @sauce = Sauce.new
  end
  def create
    sauce = Sauce.new(sauces_params)
    if sauce.save
      redirect_to sauces_path
    else
      render 'new'
    end
  end
  def show
    @sauce = Sauce.find(params[:id])
  end
  def update
    sauce = Sauce.find(params[:id])
    if sauce.update(sauces_params)
      redirect_to sauces_path
    else
      render 'edit'
    end
  end
  def destroy
    sauce = Sauce.find(params[:id])
    sauce.destroy
    redirect_to sauces_path
  end
  private
  def sauces_params
    params.require(:sauce).permit(:name)
  end
end
