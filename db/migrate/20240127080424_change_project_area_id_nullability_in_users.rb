class ChangeProjectAreaIdNullabilityInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :project_area_id, :bigint, null: true
  end
end
