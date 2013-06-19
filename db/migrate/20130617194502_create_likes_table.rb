class CreateLikesTable < ActiveRecord::Migration
  def up
    create_table :likes do |t|
      t.references :likable, null: false, polymorphic: true
      t.integer :user_id, null: false

      t.timestamps
    end
  end

  def down
    drop_table :likes
  end
end