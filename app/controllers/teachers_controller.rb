class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :index, :edit, :update, :destroy, :set_meal]
  def new
    @teacher = Teacher.new
  end

  def edit

  end

  def show

  end

  def index

  end

  private def set_meal


  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to @teacher, notice: 'Teacher was successfully created.'
    else
      render :new
    end
  end

  def update
    if @teacher.update(item_params)
      redirect_to @teacher, notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    redirect_to item_url, notice: 'Teacher was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :picture, :feature)
  end
end
