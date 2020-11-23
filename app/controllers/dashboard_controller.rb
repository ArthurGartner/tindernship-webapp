class DashboardController < ApplicationController
  def index
    user_session = Session.find_by(sessionhash: session[:hash])
    if user_session == nil 
      redirect_to '/'
      return
    end
    user_account_id = user_session.account_id
    user_account = Account.find(user_account_id)

    if user_account == nil || (user_account.accountType != 1 && user_account.accountType != 2)
      redirect_to '/'
    end
  end

  def allStudents
    students = Student.all

    render json: {students: students}
  end
end
