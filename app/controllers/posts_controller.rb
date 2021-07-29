class PostsController < ApplicationController

    def index
        posts = Post.all
        render json: posts
    end 

    def show
        post = Post.find(params[:id])
        if post 
            render json: post
        else
            render json: {error: "post not found"}
        end 
    end 

    def create
        post = Post.new(post_params)

        if post.save
            render json: post
        else
            binding.pry
        end 

    end 

    def update
        # binding.ppry
        post = Post.find(params[:id])

        if post.update(post_params)
            render json: Post.all
        else
            binding.pry
        end 

    end 

    def destroy

        post = Post.find(params[:id])
        post.destroy
        render json: Post.all
    end 

    private 

    def post_params

        params.require(:post).permit(:title, :content, :likes)

    end 


end
