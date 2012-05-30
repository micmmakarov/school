class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :lesson_id
      t.boolean :good

      t.timestamps
    end
  end
end
