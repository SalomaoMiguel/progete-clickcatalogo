class Admin::PermissionFlowActionsController < ApplicationController
  layout 'admin_application'
  before_action :set_permission_flow_action, only: [:show, :edit, :update, :destroy]
  before_action :carrega_permission_actions
  # GET /permission_flow_actions
  # GET /permission_flow_actions.json
  def index
    @permission_flow_actions = PermissionFlowAction.all
  end
  # GET /permission_flow_actions/1
  # GET /permission_flow_actions/1.json
  def show
  end
  # GET /permission_flow_actions/new
  def new
    @permission_flow_action = PermissionFlowAction.new
  end
  # GET /permission_flow_actions/1/edit
  def edit
  end
  # POST /permission_flow_actions
  # POST /permission_flow_actions.json
  def create
    @permission_flow_action = PermissionFlowAction.new(permission_flow_action_params)
    respond_to do |format|
      if @permission_flow_action.save
        format.html { redirect_to admin_permission_flows_path(@permission_flow_action) , notice: 'Permission flow action criado com sucesso.' }
        format.json { render :show, status: :created, location: @permission_flow_action }
      else
        format.html { render :new }
        format.json { render json: @permission_flow_action.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /permission_flow_actions/1
  # PATCH/PUT /permission_flow_actions/1.json
  def update
    respond_to do |format|
      if @permission_flow_action.update(permission_flow_action_params)
        format.html { redirect_to admin_permission_flows_path(@permission_flow_action), notice: 'Permission flow action atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @permission_flow_action }
      else
        format.html { render :edit }
        format.json { render json: @permission_flow_action.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /permission_flow_actions/1
  # DELETE /permission_flow_actions/1.json
  def destroy
    @permission_flow_action.destroy
    respond_to do |format|
      format.html { redirect_to admin_permission_flows_url, notice: 'Permission flow action deletado com sucesso.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission_flow_action
      @permission_flow_action = PermissionFlowAction.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def permission_flow_action_params
      params.require(:permission_flow_action).permit(:permission_flow_id, :permission_action_id)
    end
  def carrega_permission_actions
    @permission_actions = PermissionAction.joins(:permission_controller).order('permission_controllers.controller_name, permission_actions.action_name')
    @permission_flows = PermissionFlow.all
  end
end
