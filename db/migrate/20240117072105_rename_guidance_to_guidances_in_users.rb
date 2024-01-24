class RenameGuidanceToGuidancesInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :guidance, :guidances
  end
end
