# == Schema Information
#
# Table name: account_teams
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer(4)
#
# Indexes
#
#  index_account_teams_on_name_and_account_id  (name,account_id) UNIQUE
#
FactoryBot.define do
  factory :account_team do
    
  end
end
