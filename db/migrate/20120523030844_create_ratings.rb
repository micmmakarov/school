class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.integer :user_id
      t.integer :ratable_id
      t.string :ratable_type

      t.timestamps
    end
  end
end
