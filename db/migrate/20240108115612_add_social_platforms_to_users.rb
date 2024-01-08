class AddSocialPlatformsToUsers < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    add_column :users, :social_platforms, :hstore
  end
end
