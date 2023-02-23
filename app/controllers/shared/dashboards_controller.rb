# frozen_string_literal: true

class Shared::DashboardsController < ApplicationController
  include Pagy::Backend
  include Pundit::Authorization

  layout 'dashboards'

  before_action :require_login, :set_current_user

  private

  def set_current_user
    Current.user = current_user
  end
end
