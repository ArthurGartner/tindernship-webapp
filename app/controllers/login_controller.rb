class LoginController < ApplicationController
    def index
    end

    def student
    end

    def register
    end

    def employer
    end

    def admin
    end

    def poststudent
        render json: {msg: "Invalid username or password"}
    end

    def postregister
        render json: {msg: "Username is already taken"}
    end

    def postemployer
        render json: {msg: "Invalid password"}
    end

    def postadmin
        render json: {msg: "Invalid password"}
    end
end