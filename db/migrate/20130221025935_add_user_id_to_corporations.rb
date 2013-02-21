class AddUserIdToCorporations < ActiveRecord::Migration
  def change
    add_column :corporations, :user_id, :integer
  end
end
