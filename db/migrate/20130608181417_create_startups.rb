class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :name
      t.string :url
      t.text :pitch
      t.string :screenshot
      t.string :ad_banner
      t.string :location_img

      t.timestamps
    end
  end
end
