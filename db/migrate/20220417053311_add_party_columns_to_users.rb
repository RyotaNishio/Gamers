class AddPartyColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :party_id, :bigint
  end
end
