module Users

  class SessionsController < Devise::RegistrationsController

    def new
      super
    end

    def create
      user = UserAuthentication.find_by_email(user_auth_params[:email])
      raise "User not found" unless user
      raise "Check your password!" unless user.valid_password? user_auth_params[:password]

      payload = {user_email: user.email}
      private_key = OpenSSL::PKey::RSA.new(ENV['PRIVATE_API_KEY'].gsub("\\n", "\n"))
      token = JWT.encode payload, private_key, 'RS256'

      render json: {
        token: token
      }
    end

    private

    def user_auth_params
      params.require(:users_authentication).permit(%i[email password])
    end
  end
end
