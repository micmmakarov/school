class AddDefaultValueToRating < ActiveRecord::Migration
  def up
    change_column :comments, :rating, :integer, :default => 0
  end

  def down
    change_column :comments, :rating, :integer, :default => nil
  end
end
