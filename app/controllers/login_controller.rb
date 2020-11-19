require 'digest'

class LoginController < ApplicationController
    def index
      if session[:hash]
        user_session = Session.find_by(sessionhash: session[:hash])
        if user_session != nil
            user_account_id = user_session.accountid
            user_account = Account.find(user_account_id)
            if user_account != nil
                if user_account.accountType == 0
                    student_account = Student.find(user_account.accountId)
                    redirect_to student_path(student_account) and return  
                end
                
                if user_account.accountType == 1
                    redirect_to dashboard_path and return  
                end
            end
        end
      end
    end

    def student
    end

    def register
    end

    def employer
    end

    def admin
    end

    def logout
      session.delete(:hash)
      redirect_to homepage_path
    end

    def createSession accountid
        hash = Digest::MD5.hexdigest(SecureRandom.uuid)
        Session.create(sessionhash: hash, accountid: accountid, logintime: Time.now.getutc)
        hash
    end

    def post_student
        username = params[:username] || ""
        password = params[:password] || ""
        account = Account.find_by(username: username)

        if account == nil || !account.authenticate(password)
            render json: {msg: "Invalid username or password"}
        else
            puts "Account accountId at POST: #{account.accountId}"
            puts "Account account.id at POST: #{account.id}"
            hash = createSession(account.id)
            session[:hash] = hash
            student = Student.find_by(id: account.accountId)
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
        if username.length < 16
            render json: {msg:"Username too short"}
            return
        end
        if username !~ /@citadel.edu$/i
          render json: {msg:"A valid Citadel email must be used for the username"}
          return
        end
        
        user = Account.where("lower(username) = ?", username.downcase)
        
        if user.present? 
            render json: {msg: "An account with username \"#{username}\" has already been created."}
            return
        end
        
        if password.length < 8
            render json: {msg:"Password too short"}
            return
        end
        student = Student.create(availability: 'Part time')
        account = Account.create(username: username, password: password, accountType: 0, accountId: student.id)
        hash = createSession account.id
        session[:hash] = hash
        redirect_to edit_student_path(student.id)
    end

    def post_employer
        password = params[:password] || ""
        account = Account.find_by(accountType: 1)
        if account == nil || !account.authenticate(password)
            render json: {msg: "Invalid password"}
        else
            hash = createSession(account.id)
            session[:hash] = hash
            redirect_to dashboard_path
        end
    end

    def post_admin
        password = params[:password] || ""
        account = Account.find_by(accountType: 2)
        if account == nil || !account.authenticate(password)
            render json: {msg: "Invalid password"}
        else
            hash = createSession(account.id)
            session[:hash] = hash
            redirect_to admin_index_path
        end
    end
end
