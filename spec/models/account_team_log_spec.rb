# == Schema Information
#
# Table name: account_team_logs
#
#  id              :bigint(8)        not null, primary key
#  end_date        :integer(4)
#  start_date      :integer(4)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_team_id :integer(4)
#  user_id         :integer(4)
#
# Indexes
#
#  index_account_team_logs_on_account_team_id  (account_team_id)
#  index_account_team_logs_on_end_date         (end_date)
#  index_account_team_logs_on_start_date       (start_date)
#  index_account_team_logs_on_user_id          (user_id)
#
require 'rails_helper'

RSpec.describe AccountTeamLog, type: :model do
  describe 'AccountTeamLog Specs' do
    describe 'relations' do
      context '#belongs_to' do
        it {
          should belong_to :account_team
          should belong_to :user
        }
      end
    end

    describe 'validations' do

    end
  end
end
