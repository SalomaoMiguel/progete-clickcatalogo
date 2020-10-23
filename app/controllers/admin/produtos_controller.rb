class Admin::ProdutosController < ApplicationController
  layout 'admin_application'
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  before_action :origem_empresa
  before_action :produto_categoriums, only: [:new, :edit, :update, :create]
  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)
    @produto.empresa = @empresa
    respond_to do |format|
      if @produto.save
        format.html { redirect_to [:admin, @empresa], notice: 'Produto criado com sucesso.' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to [:admin, @empresa], notice: 'Produto atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to admin_empresa_path(@empresa), notice: 'Produto deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

  def origem_empresa
    @empresa = Empresa.find(params[:empresa_id])
  end

  def produto_categoriums
    @produto_categoriums = @empresa.produto_categoriums.order(:descricao)
  end
    # Only allow a list of trusted parameters through.
    def produto_params
      params.require(:produto).permit(:produto_categorium_id, :descricao, :img, :especificacao, :preco, :promocao, :disponivel, :deletado)
    end
end