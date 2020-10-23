class Admin::MenusController < ApplicationController
  layout 'admin_application'
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :set_sub_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
    @sub_menus = SubMenu.all

  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new

  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to [:admin, @menu], notice: 'Menu criado com sucesso.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to [:admin, @menu], notice: 'Menu atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to admin_menus_url, notice: 'Menu deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end
  def set_sub_menu
    @sub_menus = SubMenu.where(menu_id: params[:id])
  end

    # Only allow a list of trusted parameters through.
    def menu_params
      params.require(:menu).permit(:name, :class_icon, :active)
    end
end
