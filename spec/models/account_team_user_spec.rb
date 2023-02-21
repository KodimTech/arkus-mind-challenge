# == Schema Information
#
# Table name: account_team_users
#
#  id              :bigint(8)        not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_team_id :integer(4)
#  user_id         :integer(4)
#
# Indexes
#
#  index_account_team_users_on_account_team_id_and_user_id  (account_team_id,user_id) UNIQUE
#
require 'rails_helper'

RSpec.describe AccountTeamUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
