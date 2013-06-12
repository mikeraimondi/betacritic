class CreateMoviesTable < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.string :title, :null => false
      t.integer :year, :null => false
      t.integer :contributor_id, :null => false

      t.timestamps
    end
  end

  def down
    drop_table :movies
  end
end
