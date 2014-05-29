class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :post, index: true
      t.references :user, index: true
      t.integer :opinion

      t.timestamps
    end
  end
end
