module Users
  class RegistrationsController < Devise::RegistrationsController
    def new
      super
    end

    def create
      user = UserAuthentication.new(user_auth_params)
      raise "Something went wrong" unless user.save

      render json: {user: user}
    end

    def update
      super
    end

    private
    def user_auth_params
      params.require(:users_authentication).permit(:email, :password)
    end
  end
end
