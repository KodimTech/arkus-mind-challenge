module Admin
  class UsersController < Shared::DashboardsController
    before_action :user, only: %i[show edit update destroy]

    def index
      @pagy, @users = pagy(User.all, items: 50)
    end

    def create
      @user = User.new(permitted_params)

      if @user.save
        redirect_to admin_users_path
      else
        render :new
      end
    end

    def update
      if @user.update(permitted_params)
        redirect_to admin_users_path
      else
        render turbo_stream: turbo_stream.replace(
          'form-errors',
          render_to_string(
            Shared::Forms::ErrorsComponent.new(errors: @user.errors.full_messages)
          )
        )
      end
    end

    private

    def user
      @user ||= User.find(params[:id])
    end

    def permitted_params
      params.require(:user).permit(
        :email,
        :first_name,
        :last_name,
        :role,
        :password
      )
    end
  end
end
