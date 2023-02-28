class AddExtraDetailsFieldToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :extra_details, :jsonb
  end
end
