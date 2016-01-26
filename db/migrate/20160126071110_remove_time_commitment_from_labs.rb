class RemoveTimeCommitmentFromLabs < ActiveRecord::Migration
  def change
    remove_column :labs, :time_commitment, :integer
  end
end
