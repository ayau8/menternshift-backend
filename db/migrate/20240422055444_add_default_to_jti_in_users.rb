class AddDefaultToJtiInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :jti, :string, null: false, default: ""
  end
end
