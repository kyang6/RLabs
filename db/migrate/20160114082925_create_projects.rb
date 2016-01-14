class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.belongs_to :lab, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
