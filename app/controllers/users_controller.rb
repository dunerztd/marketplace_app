class UsersController < ApplicationController
before_action :authenticate_user!

  def student_view
  end

  def teacher_view
  end
end
