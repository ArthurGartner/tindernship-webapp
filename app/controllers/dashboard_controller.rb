class DashboardController < ApplicationController
  def index
  end

  def allStudents
    students = Student.all

    render json: {students: students}
  end
end
