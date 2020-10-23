class Admin::PermissionFlowsController < ApplicationController
  layout 'admin_application'
  before_action :set_permission_flow, only: [:show, :edit, :update, :destroy]
  before_action :all_references, only: [:show, :edit, :new, :destroy, :create ]

  # GET /permission_flows
  # GET /permission_flows.json
  def index
    @permission_flows = PermissionFlow.all
    @menus = Menu.all
  end

  # GET /permission_flows/1
  # GET /permission_flows/1.json
  def show
  end

  # GET /permission_flows/new
  def new
    @permission_flow = PermissionFlow.new
  end

  # GET /permission_flows/1/edit
  def edit
  end

  # POST /permission_flows
  # POST /permission_flows.json
  def create
    @permission_flow = PermissionFlow.new(permission_flow_params)

    respond_to do |format|
      if @permission_flow.save
        format.html { redirect_to admin_permission_flows_path, notice: 'Permission flow criado com sucesso.' }
        format.json { render :show, status: :created, location: @permission_flow }
      else
        format.html { render :new }
        format.json { render json: @permission_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permission_flows/1
  # PATCH/PUT /permission_flows/1.json
  def update
    respond_to do |format|
      if @permission_flow.update(permission_flow_params)
        format.html { redirect_to admin_permission_flows_path, notice: 'Permission flow atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @permission_flow }
      else
        format.html { render :edit }
        format.json { render json: @permission_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permission_flows/1
  # DELETE /permission_flows/1.json
  def destroy
    @permission_flow.destroy
    respond_to do |format|
      format.html { redirect_to admin_permission_flows_url, notice: 'Permission flow deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission_flow
      @permission_flow = PermissionFlow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def permission_flow_params
      params.require(:permission_flow).permit(:sub_menu_id, :name)
    end

  def all_references
    @sub_menus = SubMenu.where(active: true)
  end
end


