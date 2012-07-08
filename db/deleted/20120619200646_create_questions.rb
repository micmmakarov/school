class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :type
      t.string :text
      t.integer :user_id

      t.timestamps
    end
  end
end
