class AddAttachmentImageToLabs < ActiveRecord::Migration
  def self.up
    change_table :labs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :labs, :image
  end
end
