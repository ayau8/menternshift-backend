class CreateUserSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :user_skills do |t|
      t.string :name
      t.references :mentee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
