class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post]) #<- older version
		#@post = Post.new(params.require(:post).permit(:title, :content))
		if @post.save
			redirect_to posts_path, :notice => "Successfully created!"
		else
			render "new"
		end
	end

	def edit
		@post = Post.find(params[:id])
	end
	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			redirect_to @post
		else
			render 'edit'
		end
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end




end
