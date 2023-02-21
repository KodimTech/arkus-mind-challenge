class CreateAccountTeamUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :account_team_users do |t|
      t.integer :account_team_id
      t.integer :user_id

      t.timestamps
    end

    add_index :account_team_users, [:account_team_id, :user_id], unique: true
  end
end
