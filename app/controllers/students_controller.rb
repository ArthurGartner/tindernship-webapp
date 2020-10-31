class StudentsController < ApplicationController

  def student_params
    params.require(:student).permit(:graduation_year, :additional_information)
  end

  def edit
    @student = Student.find params[:id]
  end

  def update
    @student = Student.find params[:id]
    @student.update_attributes!(student_params)
    redirect_to student_path(params[:id]);
  end

  def show
    @student = Student.find params[:id]
  end
end
