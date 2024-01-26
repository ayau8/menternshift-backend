class CreateProjectAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :project_areas do |t|
      t.string :design
      t.string :frontend
      t.string :backend
      t.string :devops
      t.string :qa
      t.string :proj_man
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
