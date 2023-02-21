# == Schema Information
#
# Table name: users
#
#  id               :bigint(8)        not null, primary key
#  crypted_password :string
#  discarded_at     :datetime
#  email            :string           default(""), not null
#  first_name       :string           default(""), not null
#  last_name        :string           default(""), not null
#  role             :string
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_discarded_at  (discarded_at)
#  index_users_on_email         (email) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Specs' do
    describe 'relations' do
      context '#has_many' do
        it {
          should have_many(:account_team_logs).conditions(role: Users::Role::REGULAR)
        }
      end
    end

    describe 'validations' do
      context 'presence' do
        it {
          should validate_presence_of(:first_name)
          should validate_presence_of(:last_name)
          should validate_presence_of(:email)
        }
      end

      context 'uniqueness' do
        it {
          should validate_uniqueness_of(:email)
        }
      end

      context 'indexes' do
        it {
          should have_db_index(:discarded_at)
          should have_db_index(:email).unique(true)
        }
      end
    end
  end
end
