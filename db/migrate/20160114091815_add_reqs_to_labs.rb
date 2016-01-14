class AddReqsToLabs < ActiveRecord::Migration
  def change
    add_column :labs, :req, :string
  end
end
