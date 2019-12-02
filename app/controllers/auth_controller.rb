class AuthController < ApplicationController
    def create
        @user = User.find_by(email: login_params[:email])
        if @user&.authenticate(login_params[:password])
            @token = encode_token({user_id: @user.id})
            render json: {
                id: @user.id,
                email: @user.email,
                birthday: @user.birthday,
                token: @token
            }
        else
            render json: {
                error: "Invalid username or password"
            }
        end
    end

    private

    def login_params
        params.permit(:email, :password)
    end
end
