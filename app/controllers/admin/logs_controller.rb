module Admin
  class LogsController < Shared::DashboardsController
    before_action :can_access?

    def index
      @logs = AccountTeamUser.preload(:user).all

      @query = @logs.ransack(params[:query])
      @pagy, @logs = pagy(@query.result, items: 50)
    end
  end
end