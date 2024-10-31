class PostsController < ApplicationController

  def new
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(post_params)
    @new_post.user_id = current_user.id
    if @new_post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @edit_post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])  # データ（レコード）を1件取得
    post.destroy  # データ（レコード）を削除
    redirect_to '/posts'  # 投稿一覧画面へリダイレクト
  end

  # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
