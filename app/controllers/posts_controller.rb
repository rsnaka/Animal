class PostsController < ApplicationController

  def new
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(post_params)
    @new_post.user_id = current_user.id
    @new_post.save
    redirect_to post_images_path
  end

  def index
    @posts = Post.index
  end

  def show
  end

  # 投稿データのストロングパラメータ
  private

  def posts
    params.require(:new_posts).permit(:post_content, :image)
  end

end
