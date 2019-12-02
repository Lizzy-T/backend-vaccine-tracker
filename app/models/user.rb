class User < ApplicationRecord
    has_secure_password
    has_many :my_vaccines
    has_many :vaccines, through: :my_vaccines
end
