class RemoveImageFileNameFromLabs < ActiveRecord::Migration
  def change
    remove_column :labs, :image_file_name, :string
  end
end
