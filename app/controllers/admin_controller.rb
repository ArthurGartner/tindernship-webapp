class AdminController < ApplicationController
    
  def index
      user_session = Session.find_by(sessionhash: session[:hash])
      user_account = Account.find(user_session.account_id)
      
      # Ensures only admin can view this page
      if user_account.accountType != 2
          redirect_to '/'
      end
      
      @employers = Account.where(accountType: 1)
      @students = Student.all      
  end
    
    
  def delete
      # Related account should automatically be destroyed
      Student.destroy(params[:id])
      
      # raise "This didn't work" unless !(Student.exists?(id: params[:id]) && Account.exists?(account_id: params[:id]))
      redirect_to admin_index_path
  end

  def reset    
#       redirect_to admin_index_path
  end
end
