class Lojista::ProdutoCategoriasController < ApplicationController
  layout "lojista_application"
  skip_before_action :usuario_logado
  before_action :empresa_logado
  before_action :set_produto_categoria, only:[:edit, :update, :destroy]
  def index
  end
  def edit
  end
  def new
    @produto_categorium = ProdutoCategorium.new
  end
  def create
    @produto_categorium = ProdutoCategorium.new(produto_categorium_params)
    @produto_categorium.empresa = @empresa_logado.empresa
    respond_to do |format|
      if @produto_categorium.save
        format.html { redirect_to lojista_produto_categorias_index_path, notice: 'Categoria de Produto criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end
  def update
    respond_to do |format|
      if @produto_categorium.update(produto_categorium_params)
        format.html { redirect_to lojista_produto_categorias_index_path, notice: 'Categoria de Produto atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end
  def destroy
    @produto_categorium.destroy
    redirect_to lojista_produto_categorias_index_path, notice: 'Categoria de Produto deletado com sucesso.'
  end
  private
  def set_produto_categoria
    @produto_categorium = @empresa_logado.empresa.produto_categoriums.find_by_id(params[:produto_categoria_id])
  end
  def produto_categorium_params
    params.require(:produto_categorium).permit(:descricao, :disponivel)
  end
end