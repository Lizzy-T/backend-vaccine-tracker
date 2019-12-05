class UsersController < ApplicationController
    before_action :authorize_request, except: [:create, :index]
    before_action :find_user, only: [:show, :update, :destroy]
    before_action :user_params, only: [:create, :update]

    def index
        @users = User.all 

        render json: @users 
    end

    def show 
        render json: {
            email: @user.email,
            id: @user.id,
            birthday: @user.birthday
        }
    end

    def create
        @user = User.new(@params)
        if @user.save 
            @token = encode_token({user_id: @user.id})
            render json: {
                id: @user.id,
                email: @user.email,
                birthday: @user.birthday,
                token: @token
            }
        else
            render json: { error: @user.errors.full_messages },
                    status: :not_acceptable
        end
    end

    def update
        @user.update(@params)

        render json: @user
    end

    def destroy
        @user.destroy

        render json: {}, status: :no_content 
    end

    private

    def user_params
        @params = params.permit(:email, :password, :password_confirmation, :birthday)
        @params[:birthday] = Date.parse(@params[:birthday])
    end

    def find_user 
        @user = @current_user
    end
end
