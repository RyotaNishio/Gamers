class CreateUserRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rooms do |t|
      t.bigint :user_id, foreign_key: true
      t.bigint :room_id, foreign_key: true

      t.timestamps
    end
  end
end
