# frozen_string_literal: true

class Shared::DashboardsController < ApplicationController
  include Pagy::Backend
  include Pundit::Authorization

  layout 'dashboards'

  before_action :require_login, :set_current_user

  helper_method :can_access?

  private

  def set_current_user
    Current.user = current_user
  end

  def can_access?
    redirect_to dashboard_path unless current_user.role.in? %w[admin super_admin]
  end
end
