class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      render json: @comment, serializer: CommentSerializer
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end
    
  private

  def find_commentable
    @commentable = Patient.find_by(id: params[:patient_id]) if params[:patient_id]
    @commentable = Internments.find_by(id: params[:patient_id]) if params[:patient_id]
  end

  def comment_params
    params.require(:comment).permit(:body, :comment_date)
  end
end
