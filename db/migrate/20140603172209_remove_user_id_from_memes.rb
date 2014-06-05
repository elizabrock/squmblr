class RemoveUserIdFromMemes < ActiveRecord::Migration
  def change
    remove_column :memes, :userID, :string
  end
end
