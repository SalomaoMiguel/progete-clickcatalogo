class AddAttachmentImgToProdutos < ActiveRecord::Migration[5.2]
  def self.up
    change_table :produtos do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :produtos, :img
  end
end
