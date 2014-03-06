class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message
      t.integer :chatroom_id

      t.timestamps
    end
  end
end
