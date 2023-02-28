# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id               :bigint(8)        not null, primary key
#  crypted_password :string
#  discarded_at     :datetime
#  email            :string
#  extra_details    :jsonb
#  first_name       :string
#  last_name        :string
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
class User < ApplicationRecord
  authenticates_with_sorcery!

  include Discard::Model

  has_many :account_team_users
  has_many :account_teams, through: :account_team_users

  has_enumeration_for :role, with: Users::Role, create_helpers: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  jsonb_accessor :extra_details,
                 english_level: :string,
                 technical_experience: :text,
                 resume_link: :string
end
