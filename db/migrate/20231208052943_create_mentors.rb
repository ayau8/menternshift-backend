class CreateMentors < ActiveRecord::Migration[7.0]
  def change
    create_table :mentors do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :location
      t.string :damain
      t.string :years_of_experiences
      t.string :company
      t.string :job_title
      t.date :start_date
      t.date :end_date
      t.text :profile_img
      t.text :introduction

      t.timestamps
    end
  end
end
