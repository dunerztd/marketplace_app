class TeachersController < ApplicationController
  def index
    # checks whether params is defined. If so, it runs filtering method. If not, loads all teacher profiles
    if defined? params[:style][:name]
      @teachers = filter_teacher_profiles_by_style(params[:style][:name])
    else
      @teachers = Teacher.all
    end
    # loads all Styles for filtering form
    @style = Style.new
   
  end

  # Method used for filtering Teacher profiles by style
  def filter_teacher_profiles_by_style(styles)
    Teacher.where(id: TeachersStyle.where(style_id: styles).map{|x| x.teacher_id}.uniq)
  end

  # Show a single profile
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
