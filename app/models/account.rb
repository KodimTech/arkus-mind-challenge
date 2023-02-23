# == Schema Information
#
# Table name: accounts
#
#  id               :bigint(8)        not null, primary key
#  account_name     :string
#  customer_name    :string
#  responsible_name :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_accounts_on_account_name      (account_name)
#  index_accounts_on_customer_name     (customer_name)
#  index_accounts_on_responsible_name  (responsible_name)
#
class Account < ApplicationRecord
  has_many :account_teams, dependent: :destroy

  validates :account_name, presence: true, uniqueness: true
  validates :customer_name, presence: true
  validates :responsible_name, presence: true
end
