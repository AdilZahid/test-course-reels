class TemplatesController < ApplicationController
  def index
  end

  def new
    @course = Course.find_by(id: params[:course_id])

    @template = @course.templates.new
  end

  def create
    @course = Course.find_by(id: params[:course_id])
    @Template = @course.templates.new(template_params)
    if @Template.save
      redirect_to editor_course_url(id: @course.id)
    else
      render "new"
    end
  end

  private

  def template_params
    params.require(:template).permit(:file, :course_id)
  end
end
