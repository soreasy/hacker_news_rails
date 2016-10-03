class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:format]) # this feels dirty... if i used a declared resource
    # instead of current_user it would have recognized :resource_id right?
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :url)
    end
end
