class MyVaccinesController < ApplicationController
    before_action :find_user
    before_action :myvaccine_params, only: [:create, :update]

    def index
        myvaccines = @user.my_vaccines

        render json: myvaccines, include: :vaccine, except: [:created_at, :updated_at, :vaccine_id, :user_id]
    end

    def create
       @new = MyVaccine.create(@params)
       
       render json: @new, include: :vaccine, except: [:created_at, :updated_at, :vaccine_id, :user_id]
    end

    private
    def find_user
        @user = User.find(params[:user_id])
    end

    def myvaccine_params 
        @params = params.permit(:user_id, :vaccine_id, :given, :exp)
        @params[:given] = Date.parse(@params[:given])
        @params[:exp] = Date.parse(@params[:exp])
    end

end
