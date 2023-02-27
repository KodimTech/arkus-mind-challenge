module Admin
  class TeamsController < Shared::DashboardsController
    before_action :can_access?
    before_action :account
    before_action :account_team, only: %i[show edit update destroy]

    def create
      @account_team = AccountTeam.new(permitted_params)

      respond_to do |format|
        if @account_team.save
          format.turbo_stream
        else
          format.turbo_stream {
            turbo_stream.replace('modal_form', 'Errores')
          }
        end
      end
    end

    def update
      respond_to do |format|
        if @account_team.update(permitted_params)
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
      params.require(:account_team).permit(
        :account_id,
        :name
      )
    end
    def account
      @account ||= Account.find(params[:account_id])
    end

    def account_team
      @account_team ||= AccountTeam.find(params[:id])
    end
  end
end