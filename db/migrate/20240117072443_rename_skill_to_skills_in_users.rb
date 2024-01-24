class RenameSkillToSkillsInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :skill, :skills
  end
end
