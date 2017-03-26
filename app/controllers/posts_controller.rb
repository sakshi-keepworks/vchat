class PostsController < ApplicationController
  before_action :find_post, only: [:like, :dislike]

  def create
    post = Post.new(post_params)
    unless post.save
      flash[:error] = "Post could not be shared"
    end
    redirect_to :back
  end

  def post_params
    params.require(:post).permit(:blob, :user_id)
  end

  def show
  end

  def like
    @content.liked_by current_user

    if request.xhr?
      render json: { count: @content.get_likes.size, id: params[:id] }
    else
      redirect_to :back
    end
  end

  def dislike
    @content.disliked_by current_user

    if request.xhr?
      head :ok
    else
      redirect_to :back
    end
  end

  private

  def find_post
    @content = Post.find(params[:id])
  end

end
