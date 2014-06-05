class AddUserIdToMemes < ActiveRecord::Migration
  def change
    add_column :memes, :user_id, :string
  end
end
