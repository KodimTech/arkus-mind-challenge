# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountDecorator do
  let(:account) { Account.new.extend AccountDecorator }
  subject { account }
  it { should be_a Account }
end
