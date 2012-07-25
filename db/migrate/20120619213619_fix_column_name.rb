class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :questions, :type, :data_type
  end

  def down
    rename_column :questions, :data_type, :type
  end
end
