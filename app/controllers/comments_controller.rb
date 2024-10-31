class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post = post
    comment.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    comment= current_user.comment.find_by(post_id: post.id)
    comment.destroy
    redirect_to post_path(post)
  end
  
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
