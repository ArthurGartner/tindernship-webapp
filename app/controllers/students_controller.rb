class StudentsController < ApplicationController

  def student_params
    params.require(:student).permit(:firstName, :lastName, :graduationMonth, :graduationYear, :bioText, :locationPreference1,
    :locationPreference2, :locationPreference3, :availability, :resumeLink)
  end

  def edit
    @student = Student.find params[:id]

    #Attempt to find session from database that matches sessionhash in session
    user_session = Session.find_by(sessionhash: session[:hash])
    user_account_id = user_session.account_id
    user_account = Account.find(user_account_id)

    student_account = Student.find(params[:id])
    #puts "Student ID: #{student_account.id}"

    #Redirect if different or no hash is found
    if student_account.id != user_account.account_id
        #puts "Account ID: #{user_account.accountId} for user #{user_account.username}"
        redirect_to '/'
    end

    @date = Date.today
    # Get all 12 months
    @months = []
    (1..12).each do |m|
      @months << [Date::MONTHNAMES[m]]
    end
    # Get next 10 years
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

    # If no session found then redirect to root
    user_session = Session.find_by(sessionhash: session[:hash])
    if user_session == nil then
      redirect_to '/' and return
    end
    user_account_id = user_session.account_id
    user_account = Account.find(user_account_id)
    #If no account found then clear session and redirect
    if user_account == nil then
      redirect_to '/logoutredirect'
    end

    #If student account then view of other student profiles are limited
    if user_account.accountType == 0
      student_account = Student.find(params[:id])
      puts "Student ID: #{student_account.id}"

      #Redirect if logged in student does not match student viewed
      if student_account.id != user_account.account_id
        puts "Account ID: #{user_account.account_id} for user #{user_account.username}"
        redirect_to '/' and return
      end
    end
      
    @atype = user_account.accountType
     
    #Redirect for url pointing to non existing record
    rescue ActiveRecord::RecordNotFound
    redirect_to '/', :flash => { :error => "Record not found." }
  end
end
