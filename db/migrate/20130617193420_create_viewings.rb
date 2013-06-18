class CreateViewings < ActiveRecord::Migration
  def change
    create_table :viewings do |t|
      t.integer :user_id, null: false
      t.references  :viewable, null: false, polymorphic: true

      t.timestamps
    end
  end
end
