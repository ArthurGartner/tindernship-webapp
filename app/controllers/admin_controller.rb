class AdminController < ApplicationController
    
  def index
      @employers = Account.where(accountType: 1)
      @students = Student.joins(:accounts).where("account.accountId = student.id")
      
  end
    
    
  def delete
      
      
#       redirect_to admin_index_path
  end

  def reset
      
      
#       redirect_to admin_index_path
  end
end
