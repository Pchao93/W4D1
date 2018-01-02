class CommentsController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user
        @comments = @user.comments
      else
        render plain: "No such user", status: 404
        return
      end
    elsif params[:artwork_id]
      @artwork = Artwork.find_by(id: params[:artwork_id])
      if @artwork
        @comments = @artwork.comments
      else
        render plain: "No such artwork", status: 404
        return
      end
    else
      @comments = Comment.all
    end
    render json: @comments, status: 200
  end

  def create
    # render json: params
    @comment = User.new(comment_params)
    if @comment.save
      render json: @comment, status: 200
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to users_url
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :artwork_id)
  end
end
