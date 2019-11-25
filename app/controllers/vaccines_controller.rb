class VaccinesController < ApplicationController
    before_action :find_vaccine, only: :show 
    
    def index
        @vaccines = Vaccine.all 

        render json: @vaccines
    end

    def show 

        render json: @vaccine 
    end

    private

    def vaccine_params

    end

    def find_vaccine
        @vaccine = Vaccine.find(params[:id])
    end
end
