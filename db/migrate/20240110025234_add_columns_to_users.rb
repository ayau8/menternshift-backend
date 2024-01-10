class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :location, :string
    add_column :users, :company, :string
    add_column :users, :job_title, :string
    add_column :users, :profile_img, :text
    add_column :users, :bio, :text
    add_column :users, :guidance, :text, array: true, default: []
    add_column :users, :language, :text, array: true, default: []
    add_column :users, :skill, :text, array: true, default: []
    add_column :users, :isAvailable, :string
    add_column :users, :timezone, :string
  end
end
