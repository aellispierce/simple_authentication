class TeachersController < ApplicationController
  before_action :set_teacher, only: [:edit, :update, :destroy]
  before_action :authenticate_user

  def new
    @teacher = Teacher.new
  end

  def edit
  end

  def index
    @teachers= Teacher.all
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to @teacher, notice: 'Teacher was successfully created.'
    else
      render :new
    end
  end


  def login

  end

  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    redirect_to teacher_url, notice: 'Teacher was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(session[:teacher_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def teacher_params
    params.require(:teacher).permit(:name, :email, :password)
  end

  def make_session(teacher)
    session[:teacher_id] = teacher.id
    session[:name] = "John Smith"
  end
end
