class ClassificationsController < ApplicationController
  before_filter :admin?
  def index
    @classifications = Classification.all.order('weight ASC')
  end
  def new
    @classification = Classification.new
  end
  def create
    classification = Classification.new(classifications_params)
    if classification.save
      redirect_to classifications_path
    else
      render 'new'
    end
  end
  def show
    @classification = Classification.find(params[:id])
  end
  def update
    classification = Classification.find(params[:id])
    if classification.update(classifications_params)
      redirect_to classifications_path
    else
      render 'edit'
    end
  end
  def destroy
    classification = Classification.find(params[:id])
    classification.destroy
    redirect_to classifications_path
  end
  private
  def classifications_params
    params.require(:classification).permit(:weight, :name)
  end
end
