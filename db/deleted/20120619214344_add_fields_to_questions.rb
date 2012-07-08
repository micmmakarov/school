class AddFieldsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :title, :string
    add_column :questions, :description, :string
  end
end
