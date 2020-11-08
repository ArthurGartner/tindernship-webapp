class StudentsController < ApplicationController

  def student_params
    params.require(:student).permit(:firstName, :lastName, :graduationMonth, :graduationYear, :bioText, :locationPreference1,
    :locationPreference2, :locationPreference3, :availability)
  end

  def edit
    @student = Student.find params[:id]
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
  end
end
