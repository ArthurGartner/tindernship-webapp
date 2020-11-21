require 'digest'

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

    def createSession accountid
        hash = Digest::MD5.hexdigest(SecureRandom.uuid)
        Session.create(sessionhash: hash, account_id: accountid, logintime: Time.now.getutc)
        hash
    end

    def post_student
        username = params[:username] || ""
        password = params[:password] || ""
        account = Account.find_by(username: username, password: password)
        
        
        
        if account == nil
            render json: {msg: "Invalid username or password"}
        else
            puts "Account accountId at POST: #{account.account_id}"
            puts "Account account.id at POST: #{account.id}"
            hash = createSession(account.id)
            session[:hash] = hash
            student = Student.find_by(id: account.account_id)
            if student == nil
                render json: {msg: "this should literally never happen"}
            else
                redirect_to student_path(student.id)
            end
        end
    end

    def post_register
        username = params[:username] || ""
        password = params[:password] || ""
        if username.length < 3
            render json: {msg:"Username too short"}
            return
        end
        if password.length < 8
            render json: {msg:"Password too short"}
            return
        end
        student = Student.create(availability: 'Part time')
        account = Account.create(username: username, password: password, accountType: 0, account_id: student.id)
        hash = createSession account.id
        session[:hash] = hash
        redirect_to edit_student_path(student.id)
    end

    def post_employer
        password = params[:password] || ""
        account = Account.find_by(password: password, accountType: 1)
        if account == nil
            render json: {msg: "Invalid password"}
        else
            hash = createSession(account.id)
            session[:hash] = hash
            redirect_to dashboard_path
        end
    end

    def post_admin
        password = params[:password] || ""
        account = Account.find_by(password: password, accountType: 2)
        if account == nil
            render json: {msg: "Invalid password"}
        else
            hash = createSession(account.id)
            session[:hash] = hash
            redirect_to admin_index_path
        end
    end
end