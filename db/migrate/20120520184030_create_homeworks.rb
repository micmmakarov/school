class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :title
      t.string :description
      t.integer :lesson_id

      t.timestamps
    end
  end
end
