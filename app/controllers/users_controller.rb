class UsersController < ApplicationController
    protect_from_forgery with: :exception
    protect_from_forgery prepend: true

  def index
    @users = User.includes(:posts)
    render json: @users
  end
  def create
    @task = User.new(user_params)
     if @task.save
      render json: @task
     end
  end

  private def user_params
  	params.permit(:email, :password)
  end

   def update
    @task = User.find(params[:id])
    if @task.update(user_params)
      render json: @task
    else
      render json: @task.errors, status: :wrong_entity
    end
    @task = User.includes(:posts)
    render json: @task
  end
end
