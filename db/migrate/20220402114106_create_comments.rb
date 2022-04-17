class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.bigint :user_id, foreign_key: true
      t.bigint :pop_id, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
