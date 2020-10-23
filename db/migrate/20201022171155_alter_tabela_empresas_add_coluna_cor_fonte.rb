class AlterTabelaEmpresasAddColunaCorFonte < ActiveRecord::Migration[5.2]
  def change
    add_column :empresas, :cor_fonte, :string, null: false, default: '#000000'
  end
end
