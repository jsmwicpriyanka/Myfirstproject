class PostsController < ApplicationController
	before_action :authenticate_user!
	#before_action :sdf , only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
		
	end

	def show
    @post = Post.find(params[:id])
    
  end

	def new
		@post =Post.new
	end

	def create
		@post = current_user.posts.build(post_params)
 
	  if @post.save
	  	redirect_to @post
		else
			render 'new'
		end
	end

	 def edit
	  @post = Post.find(params[:id])
	 end

	def update
		
		@post = Post.find(params[:id])
		# @post = find_post
  # 	authorize!(:update, @post)

		if @post.update(post_params)
			redirect_to @post
		else 
			render 'edit'
		end
	end

	def destroy
		@post=Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private

  def post_params
    params.require(:post).permit(:status)
  end
end
	