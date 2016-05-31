class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.text :summary
      t.text :description
      t.string :category
      t.string :kitchen
      t.string :course
      t.integer :prep_time
      t.integer :cooking_time
      t.string :photo

      t.timestamps null: false
    end
  end
end
