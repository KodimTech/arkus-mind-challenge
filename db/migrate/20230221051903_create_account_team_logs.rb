class CreateAccountTeamLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :account_team_logs do |t|
      t.integer :user_id
      t.integer :account_team_id
      t.integer :start_date
      t.integer :end_date

      t.timestamps
    end

    add_index :account_team_logs, :user_id
    add_index :account_team_logs, :account_team_id
    add_index :account_team_logs, :start_date
    add_index :account_team_logs, :end_date
  end
end
