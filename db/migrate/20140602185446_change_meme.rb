class ChangeMeme < ActiveRecord::Migration
  def change
    change_table :memes do |t|
      t.remove :path
      t.string :image_path
      t.string :meme_path
      t.string :top_text
      t.string :bottom_text
    end
  end
end
