class ChangeIsAvailableToBoolean < ActiveRecord::Migration[7.0]
  def change
    # using: "is_available::boolean" is required because the database cannot
    # automatically convert from a string to a boolean, however we have no data
    # at the moment, so nothing actually needs to be processed.
    change_column :users, :is_available, :boolean, using: "is_available::boolean"
  end
end
