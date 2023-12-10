class CreateMentors < ActiveRecord::Migration[7.0]
  def change
    create_table :mentors do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :location
      t.text :profile_img
      t.text :introduction
      t.string :guidance_from
      t.text :linkedin_url
      t.text :behance_url
      t.text :instagram_url
      t.text :portfolio_url
      t.text :resume
      t.timestamps
    end
  end
end
