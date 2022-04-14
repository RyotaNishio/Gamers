class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.references :pop, foreign_key: true
      t.references :room, foreign_key: true
      t.references :comment, foreign_key: true
      t.references :chat, foreign_key: true
      t.references :party, foreign_key: true
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
