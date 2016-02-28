class LessonsController < ApplicationController
	before_action  :authenticate_user!
	before_action :require_enrollment_for_current_lesson, only: [:show]
	def show
		
	end
  private
  helper_method :current_lesson
  def require_enrollment_for_current_lesson
  	if !current_user.enrolled_in?(current_lesson)
  		 redirect_to course_path(current_lesson.section.course), alert: 'Unauthorised access,please enroll to this course to view'
	end
  end
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end