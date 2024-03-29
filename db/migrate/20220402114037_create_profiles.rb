class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.bigint :user_id, foreign_key: true
      t.string :user_name
      t.text :bio
      t.date :birthday

      t.timestamps
    end
  end
end
