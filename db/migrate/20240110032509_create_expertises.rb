class CreateExpertises < ActiveRecord::Migration[7.0]
  def change
    create_table :expertises do |t|
      t.string :domain
      t.integer :year_of_experience
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
