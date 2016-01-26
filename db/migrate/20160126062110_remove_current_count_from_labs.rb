class RemoveCurrentCountFromLabs < ActiveRecord::Migration
  def change
    remove_column :labs, :current_count, :integer
  end
end
