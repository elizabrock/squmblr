class AddGithubAvatarToUser < ActiveRecord::Migration
  def change
    add_column :users, :github_avatar, :string
  end
end
