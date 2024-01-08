class AddReferenceToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :project_area, null: false, foreign_key: true
  end
end
