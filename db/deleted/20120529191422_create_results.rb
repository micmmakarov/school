class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :lesson_id
      t.boolean :good

      t.timestamps
    end

    add_index :results, [:lesson_id, :good], :unique => true
  end
end
