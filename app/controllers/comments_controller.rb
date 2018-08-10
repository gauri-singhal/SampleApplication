class CommentsController < ApplicationController
   # protect_from_forgery prepend: true
def index
    @comment = Comment.all
  end


  def create
    @comment = Comment.new(comment_params)

      if @comment.save
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity 
      end
  end

  def update
     @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity 
      end
  end

  def destroy
    @task = Comment.find(params[:id])
    if @task.present?
      @task.destroy
    end 
  end

  private
    

  def comment_params
      params.permit(:body, :author, :post_id)
    end
end