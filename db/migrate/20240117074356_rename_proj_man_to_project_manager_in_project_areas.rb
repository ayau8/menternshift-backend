class RenameProjManToProjectManagerInProjectAreas < ActiveRecord::Migration[7.0]
  def change
    rename_column :project_areas, :proj_man, :project_manager
  end
end
