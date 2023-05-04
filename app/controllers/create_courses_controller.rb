class CreateCoursesController < ApplicationController
  def index
  end

    def new
      @create_course = CreateCourse.new
    end
  
    def create
      @create_course = CreateCourse.new(create_course_params)
  
      if @create_course.save
        redirect_to @create_course
      else
        render 'new'
      end
    end
  
    def show
      @create_course = CreateCourse.find(params[:id])
    end
  
    private
  
    def create_course_paramsroot
      params.require(:create_course).permit(:title, :script)
    end
  end
