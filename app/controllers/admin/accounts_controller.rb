module Admin
  class AccountsController < Shared::DashboardsController
    before_action :can_access?
    before_action :account, only: %i[show edit update destroy]
    def index
      @pagy, @accounts = pagy(Account.all, items: 50)
    end

    def create
      @account = Account.new(permitted_params)

      if @account.save
        redirect_to admin_accounts_path
      else
        render turbo_stream: turbo_stream.replace(
          'form-errors',
          render_to_string(
            Shared::Forms::ErrorsComponent.new(errors: @account.errors.full_messages)
          )
        )
      end
    end

    def update
      if @account.update(permitted_params)
        redirect_to admin_accounts_path
      else
        render turbo_stream: turbo_stream.replace(
          'form-errors',
          render_to_string(
            Shared::Forms::ErrorsComponent.new(errors: @account.errors.full_messages)
          )
        )
      end
    end

    private

    def account
      @account ||= Account.find(params[:id])
    end

    def permitted_params
      params.require(:account).permit(
        :responsible_id,
        :account_name,
        :customer_name
      )
    end
  end
end