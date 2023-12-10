class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :image_url
      t.date :starting_date
      t.integer :duration
      t.timestamps
    end
  end
end
