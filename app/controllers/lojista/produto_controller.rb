class Lojista::ProdutoController < ApplicationController
  layout "lojista_application"
  skip_before_action :usuario_logado
  before_action :empresa_logado
  before_action :set_produto, only: [:edit, :update, :create, :destroy]
  before_action :produto_categorium, only: [:new, :edit, :update, :create, :index]
  def index
    @produtos = (params[:form] and !params[:form][:query].blank?) ? @empresa_logado.empresa.produtos.where(produto_categorium_id: params[:form][:query].to_i) : @empresa_logado.empresa.produtos
  end
  def new
    @produto = Produto.new
  end
  def show
  end
  def create
    @produto = Produto.new(produto_params)
    @produto.empresa = @empresa_logado.empresa
    respond_to do |format|
      if @produto.save
        format.html { redirect_to lojista_produto_index_path, notice: 'Produto criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end
  def edit
  end
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to lojista_produto_index_path, notice: 'Produto atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end
  def destroy
    @produto.destroy
    redirect_to lojista_produto_index_path, notice: 'Produto deletado com sucesso.'
  end
  private
  def set_produto
    @produto = @empresa_logado.empresa.produtos.find_by_id(params[:produto_id])
  end

  def produto_categorium
    @produto_categoriums = @empresa_logado.empresa.produto_categoriums.order(:descricao)
  end

  def produto_params
    params.require(:produto).permit(:produto_categorium_id, :descricao, :disponivel, :promocao, :img, :preco)
  end
end
