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
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_discarded_at  (discarded_at)
#  index_users_on_email         (email) UNIQUE
#
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { SecureRandom.hex(4) }
  end
end
