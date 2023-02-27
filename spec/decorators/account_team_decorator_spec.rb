# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountTeamDecorator do
  let(:account_team) { AccountTeam.new.extend AccountTeamDecorator }
  subject { account_team }
  it { should be_a AccountTeam }
end
