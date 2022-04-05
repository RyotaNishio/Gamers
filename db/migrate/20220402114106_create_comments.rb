class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :pop
      t.text :body, foreign_key: true

      t.timestamps
    end
  end
end
