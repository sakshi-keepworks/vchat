class PostsController < ApplicationController
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

  def like
    @content = Post.find(params[:id])
    @content.liked_by current_user

    if request.xhr?
      head :ok
    else
      redirect_to @content
    end
  end

end
