class UsersController < ApplicationController
  def index
    @users = User.all.order({ :created_at => :desc })

    render({ :template => "users/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @user = User.where({:id => the_id }).at(0)

    render({ :template => "users/show.html.erb" })
  end

  def create
    @user = User.new
    @user.email = params.fetch("email_from_query")
    @user.password = params.fetch("password_from_query")
    @user.phone_number = params.fetch("phone_number_from_query")
    session

    if @user.valid?
      @user.save
      redirect_to("/home", { :notice => "User created successfully." })
    else
      redirect_to("/home", { :notice => "User failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @user = User.where({ :id => the_id }).at(0)

    @user.email = params.fetch("email_from_query")
    @user.password = params.fetch("password_from_query")
    @user.phone_number = params.fetch("phone_number_from_query")
    @user.student_id = params.fetch("student_id_from_query")
    @user.password_digest = params.fetch("password_digest_from_query")

    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.id}", { :notice => "User updated successfully."} )
    else
      redirect_to("/users/#{@user.id}", { :alert => "User failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @user = User.where({ :id => the_id }).at(0)

    @user.destroy

    redirect_to("/users", { :notice => "User deleted successfully."} )
  end
end
