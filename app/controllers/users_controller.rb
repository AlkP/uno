class UsersController < ApplicationController
  before_filter :admin?
  def new
    @user = User.new
  end
  def index
    @users = User.all.order('id ASC')
  end
  def show
    @user = User.find(params[:id])
    @pizzerias = Pizzeria.all.order('id ASC')
  end
  def update
    user = User.find(params[:id])
    if user.update(users_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end
  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to users_path
    else
      render "new"
    end
  end
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
  private
  def users_params
    params.require(:user).permit(:name,:password,:password_confirmation,:admin,:manager,:pizzeria_id)
  end
end
