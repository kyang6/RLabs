class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :webpage
      t.string :email
      t.integer :lab_capacity
      t.integer :current_count
      t.integer :time_commitment
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
