class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.bigint :user_id, foreign_key: true
      t.bigint :pop_id, foreign_key: true

      t.timestamps
    end
  end
end
