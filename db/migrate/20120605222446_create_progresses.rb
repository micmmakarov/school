class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.integer :user_id
      t.integer :progressable_id
      t.string :progressable_type

      t.timestamps
    end
  end
end
