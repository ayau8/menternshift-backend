class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :image_url
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.string :progress
      t.text :skill, array: true, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
