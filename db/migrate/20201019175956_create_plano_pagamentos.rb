class CreatePlanoPagamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :plano_pagamentos do |t|
      t.references :empresa, foreign_key: true, null: false
      t.string :descricao, null: false
      t.boolean :disponivel, null: false, default: true
      t.boolean :troco_ativo, null: false, default: true

      t.timestamps
    end
  end
end
