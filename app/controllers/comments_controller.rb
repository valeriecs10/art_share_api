class CommentsController < ApplicationController
  def index
    render json: Comment.where(comment_params)
  end

  def create
    new_comment = Comment.new(comment_params)
    if new_comment.save
      render json: new_comment
    else
      render json: new_comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment_to_delete = comment
    if comment
      comment.destroy
      render json: comment_to_delete
    else
      render plain: "Invalid comment id", status: :unprocessable_entity
    end
  end

  private

  def comment
    Comment.find_by_id(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end