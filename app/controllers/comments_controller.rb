class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(post_id: post.id)
    comment.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    comment= current_user.comment.find_by(post_id: post.id)
    comment.destroy
    redirect_to post_path(post)
  end
end
