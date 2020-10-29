class LoginController < ApplicationController
    def index
    end

    def student
    end

    def register
    end

    def employer
    end

    def poststudent
        render json: "Invalid username or password"
    end

    def postregister
        render json: "Username is already taken"
    end

    def postemployer
        render json: "Invalid password"
    end
end