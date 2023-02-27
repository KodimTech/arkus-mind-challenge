# frozen_string_literal: true

module SharedDecorator
  def self.sidebar_option_status(request:, url:)
    request.path.include?(url) ? 'active' : nil
  end

  def self.sidebar_option_color(request:, url:)
    request.path.include?(url) ? 'white' : 'black'
  end
end
