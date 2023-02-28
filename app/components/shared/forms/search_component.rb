# frozen_string_literal: true

class Shared::Forms::SearchComponent < ViewComponent::Base
  include Ransack::Helpers::FormHelper

  attr_accessor :url, :query
  def initialize(url:, query:)
    @url = url
    @query = query
  end
end
