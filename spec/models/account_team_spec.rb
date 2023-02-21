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
require 'rails_helper'

RSpec.describe AccountTeam, type: :model do
  describe 'AccountTeam Specs' do
    describe '#relations' do
      context '#belongs_to' do
        it {
          should belong_to :account
        }
      end
    end

    describe 'validations' do
      describe '#presence' do
        it {
          should validate_presence_of :name
        }
      end

      describe '#uniqueness' do
        it {
          should validate_uniqueness_of(:name).scoped_to(:account_id)
        }
      end

      describe '#indexes' do
        it {
          should have_db_index([:name, :account_id])
        }
      end
    end
  end
end
