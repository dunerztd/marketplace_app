class TeachersController < ApplicationController
  def index
    # # if params
    # then search by style id
    # where teacher.styles.id == params[:style][:name]

    # Style.find(16).teachers.all


    # params[:style][:name].each do |style|
    #   @teacher = Style.find(style).teachers.all
    # end

    # def find_all_teachers_with_styles(styles = [:jazz, :rock etc])

    # Model.where(id: [array of values])

    # # Teacher.find
    # - Remove speciality from styles table
    # - put speciality into join table

    @teachers = Teacher.all
    @style = Style.new
   
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
