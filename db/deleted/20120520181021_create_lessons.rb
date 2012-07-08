class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :description
      t.text :text
      t.datetime :time
      t.string :address
      t.integer :course_id

      t.timestamps
    end
  end
end
