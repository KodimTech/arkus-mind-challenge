module Admin
  class TeamUsersController < Shared::DashboardsController
    before_action :can_access?, :account, :account_team

    def new
      @users_list = User.where.not(id: account_team.users.ids).where(role: Users::Role::REGULAR)
    end

    def create
      @account_team_user = AccountTeamUser.new(permitted_params)
      @account_team_user.status = AccountTeamUsers::Status::ACTIVE

      respond_to do |format|
        if @account_team_user.save
          @account_team_user.inactive_previous

          format.turbo_stream
        else
          format.turbo_stream {
            turbo_stream.replace('modal_form', 'Display errors here')
          }
        end
      end
    end

    private

    def permitted_params
      params.require(:account_team_user).permit(
        :user_id,
        :account_team_id,
        :start_date,
        :end_date
      )
    end

    def account
      @account ||= Account.find(params[:account_id])
    end

    def account_team
      @account_team ||= AccountTeam.find(params[:team_id])
    end
  end
end