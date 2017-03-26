class WelcomeController < ApplicationController
  def index
    @posts = Post.order(:cached_votes_up).reverse
    @post = Post.new
  end
end
