class AddUserToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :userId, :string
  end
end
