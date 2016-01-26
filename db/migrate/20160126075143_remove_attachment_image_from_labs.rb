class RemoveAttachmentImageFromLabs < ActiveRecord::Migration
  def change
    remove_column :labs, :attachment_image, :string
  end
end
