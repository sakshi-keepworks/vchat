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
end
