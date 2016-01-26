class RemoveImageUpdatedAtFromLabs < ActiveRecord::Migration
  def change
    remove_column :labs, :image_updated_at, :datetime
  end
end
