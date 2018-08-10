# frozen_string_literal: true

# Handle post requests
class PostsController < ApplicationController
    #protect_from_forgery prepend: true
  def index
    @posts = Post.includes(:comments)
    render json: @posts
  end
  
  def create
    #byebug
    @task = Post.new(post_params)
     if @task.save
      render json: @task
     end
  end

   def update
    @task = Post.find(params[:id])
    if @task.update(post_params)
      render json: @task
    else
      render json: @task.errors, status: :wrong_entity
    end
    @posts = Post.includes(:comments)
    render json: @posts
  end

  private 
  def post_params
  	params.permit(:title, :content, :published, :user_id)
  end

  

end
