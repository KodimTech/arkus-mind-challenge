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
class AccountTeam < ApplicationRecord
  belongs_to :account

  has_many :account_team_logs, dependent: :destroy

  has_many :account_team_users, dependent: :destroy
  has_many :user, through: :account_team_users

  validates :name, presence: true, uniqueness: { scope: :account_id }
end