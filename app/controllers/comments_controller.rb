class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  def index
    @comments = current_user.comments
    render json: @comments, status: :ok
  end

  def show
    render json: @comment, serializer: CommentSerializer
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      render json: @comment, serializer: CommentSerializer
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment, serializer: CommentSerializer
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    @comment.destroy
    if @comment.destroyed?
      render json: {}, status: :no_content
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  private

  def set_comment
     @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id, :comment_date, :user_id)
  end
end
