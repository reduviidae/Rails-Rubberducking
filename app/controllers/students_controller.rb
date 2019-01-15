class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :update, :edit]
  before_action :list_ducks
  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.create(get_student_params)
    if student.valid?
      student.save
      redirect_to student_path(student)
    else
       render :new
    end
  end

  def edit
  end

  def update
    @student.assign_attributes(get_student_params)
    if @student.valid?
      @student.update(get_student_params)
      redirect_to student_path(@student)
    else
      render :edit
    end
  end


  private

  def find_student
    @student = Student.find(params[:id])
  end

  def list_ducks
    @ducks = Duck.all
  end

  def get_student_params
    params.require(:student).permit(:name, :mod)
  end

end
