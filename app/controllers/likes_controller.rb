class LikesController < ApplicationController
	# This action will show our likes for a user.
  # Lets assume you have an authentication system (ex Devise) that logs a user in and provides a `current_user` object
  # GET /likes
  def index
    # Assign the logged in user to @user
    @user = current_user
    # Grab all of the books and put them into an array in @books
    @post = Post.all
  end

  


  # This is our key action. We will use this action to create a Like
  # POST /likes
  def post_like
    # Grab our book from the DB. Note that this syntax is for Rails 3.2 and below. Rails 4 uses something called Strong Parameters, but that is for another time. 
    @post = Post.find(params[:post_id])
    
    user = current_user

    # Create a like
    like = @post.likes.build
    like.user_id=user.id
    like.save

    
    
    redirect_to posts_path

  end

  def comment_like
   @comment = Comment.find(params[:comment_id])
   user = current_user
   comment = @comment.likes.build
   comment.user_id=user.id
   comment.save

    redirect_to posts_path
  end
  

  def destroy
    # Get the like form the DB
    like = Like.find(params[:id])
    # destroy it
    like.destroy
    redirect_to posts_path, :notice => " Unlike"
  end
end

