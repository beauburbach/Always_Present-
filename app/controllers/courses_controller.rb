class CoursesController < ApplicationController
  def index
    @courses = Course.all.order({ :created_at => :desc })

    render({ :template => "courses/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @course = Course.where({:id => the_id }).at(0)

    render({ :template => "courses/show.html.erb" })
  end

  def create
    @course = Course.new
    @course.name = params.fetch("name_from_query")
    @course.class_time = params.fetch("class_time_from_query")
    @course.description = params.fetch("description_from_query")
    @course.user_id = params.fetch("user_id_from_query")
    @course.day_of_the_week = params.fetch("day_of_the_week_from_query")
    @course.teacher = params.fetch("teacher_from_query")

    if @course.valid?
      @course.save
      redirect_to("/courses", { :notice => "Course created successfully." })
    else
      redirect_to("/courses", { :notice => "Course failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @course = Course.where({ :id => the_id }).at(0)

    @course.name = params.fetch("name_from_query")
    @course.class_time = params.fetch("class_time_from_query")
    @course.description = params.fetch("description_from_query")
    @course.user_id = params.fetch("user_id_from_query")
    @course.day_of_the_week = params.fetch("day_of_the_week_from_query")
    @course.teacher = params.fetch("teacher_from_query")

    if @course.valid?
      @course.save
      redirect_to("/courses/#{@course.id}", { :notice => "Course updated successfully."} )
    else
      redirect_to("/courses/#{@course.id}", { :alert => "Course failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @course = Course.where({ :id => the_id }).at(0)

    @course.destroy

    redirect_to("/courses", { :notice => "Course deleted successfully."} )
  end
end
