class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.text :citation
      t.integer :year
      t.string :link
      t.belongs_to :lab, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
