class AddAttachmentPicToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :pic_file_name, :string
    add_column :users, :pic_content_type, :string
    add_column :users, :pic_file_size, :integer
    add_column :users, :pic_updated_at, :datetime
  end

  def self.down
    remove_column :users, :pic_file_name
    remove_column :users, :pic_content_type
    remove_column :users, :pic_file_size
    remove_column :users, :pic_updated_at
  end
end
