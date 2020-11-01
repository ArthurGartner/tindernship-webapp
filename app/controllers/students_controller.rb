class StudentsController < ApplicationController

  def student_params
    params.require(:student).permit(:graduationMonth, :graduationYear, :bioText, :locationPreference1,
    :locationPreference2, :locationPreference3, :fullTime, :partTime)
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
