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

    def post_student
        render json: {msg: "Invalid username or password"}
    end

    def post_register
        render json: {msg: "Username is already taken"}
    end

    def post_employer
        render json: {msg: "Invalid password"}
    end

    def post_admin
        render json: {msg: "Invalid password"}
    end
end