class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.string :customer_name
      t.integer :responsible_id

      t.timestamps
    end

    add_index :accounts, :account_name
    add_index :accounts, :customer_name
  end
end
