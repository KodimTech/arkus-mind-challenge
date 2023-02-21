# frozen_string_literal: true

class Shared::Forms::ErrorsComponent < ViewComponent::Base
  attr_accessor :errors

  def initialize(errors:)
    @errors = errors
  end
end
