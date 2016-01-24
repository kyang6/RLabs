class AddCategoryToLabs < ActiveRecord::Migration
  def change
    add_column :labs, :category, :string
  end
end
