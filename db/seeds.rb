# frozen_string_literal: true

Rails.logger.info '===== Running seeds'

FactoryBot.create(
  :user,
  email: 'lbarroeta@arkusnexus.com',
  role: Users::Role::SUPER_ADMIN,
  password: 'password'
)

Rails.logger.info '===== Finished seeds'
