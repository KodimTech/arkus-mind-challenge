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
require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'Account Specs' do
    describe 'relations' do
      context '#has_many' do
        it {
          should have_many(:account_teams).dependent(:destroy)
        }
      end
    end

    describe 'validations' do
      context '#presence' do
        it {
          should validate_presence_of :account_name
          should validate_presence_of :customer_name
          should validate_presence_of :responsible_name
        }
      end

      context '#uniqueness' do
        it {
          should validate_uniqueness_of :account_name
        }
      end
    end
  end
end
