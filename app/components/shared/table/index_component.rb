# frozen_string_literal: true

class Shared::Table::IndexComponent < ViewComponent::Base
  attr_accessor :data, :rows_partial, :headers, :klass, :turbo_frame

  def initialize(data:, rows_partial:, headers:)
    super

    @data = data
    @rows_partial = rows_partial
    @headers = headers

    @klass = @data.klass.name.downcase
    @turbo_frame = "#{klass.underscore.tr('_', '-')}-table"
  end
end
