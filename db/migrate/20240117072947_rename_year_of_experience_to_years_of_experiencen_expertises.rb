class RenameYearOfExperienceToYearsOfExperiencenExpertises < ActiveRecord::Migration[7.0]
  def change
    rename_column :expertises, :year_of_experience, :years_of_experience
  end
end
