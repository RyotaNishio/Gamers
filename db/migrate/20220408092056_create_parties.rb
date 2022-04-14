class CreateParties < ActiveRecord::Migration[6.1]
  def change
    create_table :parties do |t|
      t.integer :owner_id
      t.string :title
      t.text :introduction
      t.integer :difficulty
      t.integer :recruitment_numbers

      t.timestamps
    end
  end
end
