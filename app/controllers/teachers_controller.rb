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
    @teacher = Teacher.new
    @styles = Style.all
  end

  def create

  Teacher.create(
    availability: params[:teacher][:availability],
    price: params[:teacher][:price],
    lesson_length: params[:teacher][:lesson_length],
    bio: params[:teacher][:bio],
    teaching_info: params[:teacher][:teaching_info],
    user_id: current_user.id
  )

    speciality = Style.find(params[:teacher][:speciality])
    speciality.teachers_styles
    current_user.teacher.styles << speciality
    current_user.teacher.teachers_styles.first.update(speciality: true)

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
end
