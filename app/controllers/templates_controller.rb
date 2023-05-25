class TemplatesController < ApplicationController
  before_action :set_course ,only: [:new, :create]
  def index
  end

  def new
    @template = @course.templates.new
  end

  def create
    @Template = @course.templates.new(template_params)
    if @Template.save
      redirect_to editor_course_url(id: @course.id)
    else
      render "new"
    end
  end

  private
  def set_course
    @course = Course.find_by(id: params[:course_id])
  end
  def template_params
    params.require(:template).permit(:file, :course_id)
  end
end
