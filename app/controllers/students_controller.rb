class StudentsController < ApplicationController

  def student_params
    params.require(:student).permit(:firstName, :lastName, :graduationMonth, :graduationYear, :bioText, :locationPreference1,
    :locationPreference2, :locationPreference3, :availability, :resumeLink)
  end

  def edit
    @student = Student.find params[:id]
    
    # Verifies the logged in student can only edit their profile
    user_session = Session.find_by(sessionhash: session[:hash])
    user_account_id = user_session.account_id
    user_account = Account.find(user_account_id)
    student_account = Student.find(params[:id])

    # If current logged in student tries to edit another page - will be redirected to home page.
    if student_account.id != user_account.account_id
        redirect_to '/'
    end

    @date = Date.today
    @months = []
    (1..12).each do |m|
      @months << [Date::MONTHNAMES[m]]
    end
    @years = []
    (0..9).each do |y|
      @years << [@date.next_year(y).strftime("%Y")]
    end
  end

  def update
    @student = Student.find params[:id]
    @student.update_attributes!(student_params)
    redirect_to student_path(params[:id]);
  end

  def show
    @student = Student.find params[:id]
    
    # Verifies the logged in student can only view their profile
    user_session = Session.find_by(sessionhash: session[:hash])
    
    # If no user session is present then user will be redirected to home page.  
    if user_session == nil then
      redirect_to '/' and return
    end
        
    user_account_id = user_session.account_id
    user_account = Account.find(user_account_id)
    if user_account == nil then
      redirect_to '/logoutredirect'
    end
    
    # Check to see if accountType == 0, which is type for student account.
    if user_account.accountType == 0
      student_account = Student.find(params[:id])

    # If current logged in student tries to view another page - will be redirected to home page. 
    if student_account.id != user_account.account_id
        redirect_to '/' and return
      end
    end
      
    @atype = user_account.accountType
      
    rescue ActiveRecord::RecordNotFound
    redirect_to '/', :flash => { :error => "Record not found." }
  end
end
