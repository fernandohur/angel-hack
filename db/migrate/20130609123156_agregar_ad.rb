class AgregarAd < ActiveRecord::Migration
  def self.up
    add_column :startups, :ad_file_name, :string # Original filename
    add_column :startups, :ad_content_type, :string # Mime type
    add_column :startups, :ad_file_size, :integer # File size in bytes
  end

  def self.down
    remove_column :startups, :ad_file_name
    remove_column :startups, :ad_content_type
    remove_column :startups, :ad_file_size
  end
end
