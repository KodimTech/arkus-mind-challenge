class CreateAccountTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :account_teams do |t|
      t.integer :account_id
      t.string :name

      t.timestamps
    end

    add_index :account_teams, [:name, :account_id], unique: true
  end
end
