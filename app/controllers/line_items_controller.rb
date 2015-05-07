class LineItemsController < ApplicationController
  before_filter :admin?, except: [:create, :destroy]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    unless params[:error]
      if params[:pizza] == "true"
        vari = {:pizza => true,
                :id => params[:id],
                :name => params[:name],
                :url => params[:url],
                :size => params[:size],
                :dough => params[:dough],
                :price => params[:price] }
        qw = podschet current_cart.id, vari
      else
        vari = {:id => params[:id],
                :pizza => false,
                :name => params[:name],
                :url => params[:url],
                :size => params[:size],
                :price => params[:price],
                :set => params[:set],
                :modifier => params[:modifier]}
        qw = podschet current_cart.id, vari
      end
    end
    if qw
      @pr     = session[:cookie]
      @amount = session[:price]
      @count  = session[:count]
    else
      @pr     = []
      @amount = 0
      @count  = 0
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    z = []
    session[:cookie].each do |f|
      if f[:pizza]
        unless (f[:id].to_s == params[:id]) && (f[:pizza].to_s == params[:pizza]) && (f[:size].to_s == params[:size]) && (f[:dough].to_s == params[:dough])
          z += [f]
        end
      else
        unless (f[:id].to_s == params[:id]) && (f[:pizza].to_s == params[:pizza]) && (f[:size].to_s == params[:size])
          z += [f]
        end
      end
    end
    session[:cookie] = z
    qw = podschet current_cart.id
    if qw
      @pr     = session[:cookie]
      @amount = session[:price]
      @count  = session[:count]
    else
      @pr     = []
      @amount = 0
      @count  = 0
    end
    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to line_items_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      if LineItem.where('id = ?',params[:id]).nil?
        false
      else
        @line_item = LineItem.where('id = ?',params[:id]).first
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
end
