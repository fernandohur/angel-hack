class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.integer :startup_id
      t.integer :sponsor_id

      t.timestamps
    end
  end
end
