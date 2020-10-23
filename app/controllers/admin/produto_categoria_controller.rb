class Admin::ProdutoCategoriaController < ApplicationController
  layout "admin_application"
  before_action :set_produto_categorium, only: [:edit, :update, :destroy]
  before_action :carrega_empresa

  # GET /produto_categoria/new
  def new
    @produto_categorium = ProdutoCategorium.new
  end

  # GET /produto_categoria/1/edit
  def edit
  end

  # POST /produto_categoria
  # POST /produto_categoria.json
  def create
    @produto_categorium = ProdutoCategorium.new(produto_categorium_params)
    @produto_categorium.empresa = @empresa
    respond_to do |format|
      if @produto_categorium.save
        format.html { redirect_to [:admin, @empresa], notice: 'Categoria de Produto criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /produto_categoria/1
  # PATCH/PUT /produto_categoria/1.json
  def update
    respond_to do |format|
      if @produto_categorium.update(produto_categorium_params)
        format.html { redirect_to [:admin, @empresa], notice: 'Categoria de Produto atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /produto_categoria/1
  # DELETE /produto_categoria/1.json
  def destroy
    @produto_categorium.destroy
    respond_to do |format|
      format.html { redirect_to admin_empresa_path(@empresa), notice: 'Categoria de Produto deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto_categorium
      @produto_categorium = ProdutoCategorium.find(params[:id])
    end

  def carrega_empresa
    @empresa = Empresa.find(params[:empresa_id])
  end
    # Only allow a list of trusted parameters through.
    def produto_categorium_params
      params.require(:produto_categorium).permit(:empresa_id, :descricao, :disponivel)
    end
end
