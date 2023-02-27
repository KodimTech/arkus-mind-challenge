# frozen_string_literal: true

class Shared::Table::IndexRowsComponent < ViewComponent::Base
  include Turbo::FramesHelper

  attr_accessor :data, :rows_partial, :headers_count, :klass

  def initialize(data:, rows_partial:)
    @data = data
    @rows_partial = rows_partial

    @klass = @data.klass.name.underscore
  end
end
