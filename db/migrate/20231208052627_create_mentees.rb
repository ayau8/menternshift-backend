class CreateMentees < ActiveRecord::Migration[7.0]
  def change
    create_table :mentees do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :location
      t.string :company
      t.string :job_title
      t.string :domain
      t.text :profile_img
      t.text :introduction
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
