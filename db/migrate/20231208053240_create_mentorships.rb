class CreateMentorships < ActiveRecord::Migration[7.0]
  def change
    create_table :mentorships do |t|
      t.references :mentee, null: false, foreign_key: true
      t.references :mentor, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
