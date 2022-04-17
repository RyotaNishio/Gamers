class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.bigint :user_id, foreign_key: true
      t.bigint :room_id, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
