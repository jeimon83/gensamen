class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :find_commentable, only: [:index, :create]

  def index
    @comment = @commentable.comments
    render json: @comment
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    if @comment.save
      render json: @comment, serializer: CommentSerializer
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: @comment
  end
  
  def update
     if @comment.update comment_params
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

  def find_commentable
    @commentable = Patient.find_by(id: params[:patient_id]) if params[:patient_id]
    @commentable = Internment.find_by(id: params[:internment_id]) if params[:internment_id]
    @commentable = ReportRequest.find_by(id: params[:report_request_id]) if params[:report_request_id]
    @commentable = HelpRequest.find_by(id: params[:help_request_id]) if params[:help_request_id]
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :comment_date)
  end
end
