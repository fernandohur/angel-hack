class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :facebook_id
      t.string :name
      t.integer :startup_id

      t.timestamps
    end
  end
end