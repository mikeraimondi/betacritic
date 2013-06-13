class CreateReviewsTable < ActiveRecord::Migration
  def up
    create_table :reviews do |t|
      t.text :review, :null => false
      t.integer :rating, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :reviews
  end
end
