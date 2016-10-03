class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    puts "WE GOT IN DER"
  end
end
