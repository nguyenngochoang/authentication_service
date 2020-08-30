module Users

  class SessionsController < Devise::RegistrationsController

    def new
      super
    end

    def create
      user = UserAuthentication.find_by_email(user_auth_params[:email])
      raise "User not found" unless user

      unless user.valid_password? user_auth_params[:password]
        render json: {
          error: "Check your password!"
        }
      else
        render json: user
      end
    end

    private

    def user_auth_params
      params.require(:users_authentication).permit(%i[email password])
    end
  end
end
