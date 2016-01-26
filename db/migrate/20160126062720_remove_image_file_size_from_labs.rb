class RemoveImageFileSizeFromLabs < ActiveRecord::Migration
  def change
    remove_column :labs, :image_file_size, :integer
  end
end
