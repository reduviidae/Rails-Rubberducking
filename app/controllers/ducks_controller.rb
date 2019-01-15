class DucksController < ApplicationController
  before_action :find_duck, only: [:show, :update, :edit]
  before_action :list_students

  def index
    @ducks = Duck.all
  end

  def new
    @duck = Duck.new
  end

  def create
    duck = Duck.create(get_duck_params)
    if duck.valid?
      duck.save
      redirect_to duck_path(duck)
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    @duck.assign_attributes(get_duck_params)
    if @duck.valid?
      @duck.update(get_duck_params)
      redirect_to duck_path(@duck)
    else
      render :edit
    end
  end

  private

  def find_duck
    @duck = Duck.find(params[:id])
  end

  def list_students
    @students = Student.all
  end

  def get_duck_params
    params.require(:duck).permit(:name, :description, :student_id)
  end


end
