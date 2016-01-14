class AddDirectorToLabs < ActiveRecord::Migration
  def change
    add_column :labs, :director, :string
  end
end
