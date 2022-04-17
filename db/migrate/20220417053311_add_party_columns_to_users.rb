class AddPartyColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :party, foreign_key: true
  end
end
