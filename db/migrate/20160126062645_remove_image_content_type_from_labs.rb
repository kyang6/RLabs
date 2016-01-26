class RemoveImageContentTypeFromLabs < ActiveRecord::Migration
  def change
    remove_column :labs, :image_content_type, :string
  end
end
