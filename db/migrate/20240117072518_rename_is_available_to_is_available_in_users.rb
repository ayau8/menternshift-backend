class RenameIsAvailableToIsAvailableInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :isAvailable, :is_available
  end
end
