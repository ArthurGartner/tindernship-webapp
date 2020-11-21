class AdminController < ApplicationController
    
  def index
      @employers = Account.where(accountType: 1)
      @students = Student.joins("INNER JOIN accounts ON accounts.account_id = student.id")
      
  end
    
    
  def delete
      
      
#       redirect_to admin_index_path
  end

  def reset
      
      
#       redirect_to admin_index_path
  end
end
