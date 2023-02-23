class ChangeResponsibleNameColumnAtAccountsTable < ActiveRecord::Migration[7.0]
  def change
    change_column :accounts, :responsible_name, :string
  end
end
