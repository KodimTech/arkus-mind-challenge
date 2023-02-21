module Shared
  class ProfilesController < Shared::DashboardsController
    before_action :user

    def update
      if @user.update(permitted_params)
        render turbo_stream: turbo_stream.replace(
          "user_#{@user.id}",
          partial: '/shared/profiles/partials/show_profile'
        )
      else
        render turbo_stream: turbo_stream.replace(
          'form-errors',
          render_to_string(Shared::Forms::ErrorsComponent.new(errors: @user.errors.full_messages))
        )
      end
    end

    private

    def user
      @user ||= User.find(params[:id])
    end

    def permitted_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password
      )
    end
  end
end