class AddYearToLabs < ActiveRecord::Migration
  def change
    add_column :labs, :year, :string
  end
end
