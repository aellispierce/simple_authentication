class ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  def new
    @parent= Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      redirect_to parents_path, notice: 'Parent was successfully created.'
    else
      render :new
    end
  end

  def edit

  end

  def show

  end

  def index
    @parents= Teacher.find(session[:teacher_id]).parents
    @teacher= Teacher.find(session[:teacher_id])
  end


  def update
    if @parent.update(parent_params)
      redirect_to parents_path, notice: 'Parent was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @parent.destroy
    redirect_to parent_url, notice: 'Parent was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_parent
    @parent = Parent.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def parent_params
    params.require(:parent).permit(:name, :email, :child_name, :teacher_id)
  end



end
