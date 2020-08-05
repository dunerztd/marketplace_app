class TeachersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

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

  # Sets up the form for Profile creation
  def new
    @teacher = Teacher.new
    @styles = Style.all
  end

  # Create a new Teacher Profile
  def create

    # Teacher Profile creation
    Teacher.create(
      availability: params[:teacher][:availability],
      price: params[:teacher][:price],
      lesson_length: params[:teacher][:lesson_length],
      bio: params[:teacher][:bio],
      teaching_info: params[:teacher][:teaching_info],
      user_id: current_user.id,
      picture: params[:teacher][:picture]
    )

    # Adds a style with the speciality marked as true in teachers_styles join table
    speciality = Style.find(params[:teacher][:speciality])
    current_user.teacher.styles << speciality
    current_user.teacher.teachers_styles.first.update(speciality: true)

    # Adds all other styles
    params[:teacher][:styles].each do |style|
      found_style = Style.find(style)
      current_user.teacher.styles << found_style
    end

    redirect_to teacher_path(current_user.teacher.id)

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def profile_params
  end
end