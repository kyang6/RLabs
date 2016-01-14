class AddSuggestedToLabs < ActiveRecord::Migration
  def change
    add_column :labs, :suggested, :string
  end
end
