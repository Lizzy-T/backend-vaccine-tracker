class ApplicationController < ActionController::API

    def encode_token(payload)
        payload[:exp] = 24.hours.from_now.to_i
        JWT.encode(payload, Rails.application.credentials.dig(:secret_key_base))
    end


    def authorize_request
        header = request.headers['Authorization']
        token = header.split(' ').last if header
        begin
            @decoded = JWT.decode(token, Rails.application.credentials.dig(:secret_key_base), true, algorithm: 'HS256')[0]
            @current_user = User.find(@decoded["user_id"])
        rescue ActiveRecord::RecordNotFound => e 
            render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e 
            render json: { errors: e.message }, status: :unauthorized
        end
    end
end
