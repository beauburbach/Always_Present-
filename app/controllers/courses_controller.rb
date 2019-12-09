class CoursesController < ApplicationController
  def index
    @courses = current_user.courses

    render({ :template => "courses/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @course = Course.where({:id => the_id }).at(0)

    render({ :template => "courses/show.html.erb" })
  end

   def find_user
   @user = User.find_by(email: params.fetch("email_from_query"))
   if @user && @user.authenticate(params.fetch("password_from_query"))
      redirect_to '/home'
      session[:user_id] = @user.id
   else
      redirect_to("/login", alert: "User Account not found")
   end
end
  def create
    @course = Course.new
    @course.name = params.fetch("name_from_query")
    @course.class_time = params.fetch("class_time_from_query")
    @course.description = params.fetch("description_from_query")
    @course.user_id = current_user.id
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

    respond_to do |format|
      format.html {redirect_to(courses_url)}
      format.xml { head :no_content}
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/courses/home")
  end
end
