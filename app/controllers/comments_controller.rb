class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_post

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id =current_user.id
    @comment.save
    redirect_to  posts_path
    
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :user_id)
    end

    def find_post
      @post = Post.find(params[:post_id])
    end
end

