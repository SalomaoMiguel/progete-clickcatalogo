class AddAttachmentAvatarToEmpresaUsuarios < ActiveRecord::Migration[5.2]
  def self.up
    change_table :empresa_usuarios do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :empresa_usuarios, :avatar
  end
end
