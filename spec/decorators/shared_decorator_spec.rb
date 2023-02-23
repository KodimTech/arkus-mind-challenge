# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SharedDecorator do
  let(:shared) { Shared.new.extend SharedDecorator }
  subject { shared }
  it { should be_a Shared }
end
