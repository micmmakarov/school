class AddUnsubscribeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :unsubscribe_link, :string
  end
end
