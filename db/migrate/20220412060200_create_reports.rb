class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :reportor_id
      t.integer :reported_user_id
      t.text :content

      t.timestamps
    end
  end
end
