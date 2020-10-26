class AddAttachmentLogomarcaToEmpresas < ActiveRecord::Migration[5.2]
  def self.up
    change_table :empresas do |t|
     t.attachment :logomarca
    end
  end

  def self.down
    remove_attachment :empresas, :logomarca
  end
end
