class MyVaccinesController < ApplicationController
    before_action :authorize_request
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
        @user = @current_user
    end

    def myvaccine_params 
        @params = params.permit(:vaccine_id, :given, :exp)
        @params[:given] = Date.parse(@params[:given])
        if @params[:exp]
            @params[:exp] = Date.parse(@params[:exp])
        end
        @params[:user_id] = @user.id
    end

end
