class CreatePops < ActiveRecord::Migration[6.1]
  def change
    create_table :pops do |t|
      t.bigint :user_id, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
