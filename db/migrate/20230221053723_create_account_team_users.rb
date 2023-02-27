class CreateAccountTeamUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :account_team_users do |t|
      t.integer :account_team_id
      t.integer :user_id
      t.string :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end

    add_index :account_team_users, [:account_team_id, :user_id], unique: true
    add_index :account_team_users, :end_date
    add_index :account_team_users, :start_date
  end
end
