class RenameLanguageToLanguagesInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :language, :languages
  end
end
