class AddTimeCommitmentToLabs < ActiveRecord::Migration
  def change
    add_column :labs, :time_commitment, :string
  end
end
