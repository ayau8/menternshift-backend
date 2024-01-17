class RenameSkillToSkillsInProjects < ActiveRecord::Migration[7.0]
  def change
    rename_column :projects, :skill, :skills
  end
end
