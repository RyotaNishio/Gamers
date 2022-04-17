class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.bigint :pop_id, foreign_key: true
      t.bigint :room_id, foreign_key: true
      t.bigint :comment_id, foreign_key: true
      t.bigint :chat_id, foreign_key: true
      t.bigint :party_id, foreign_key: true
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
