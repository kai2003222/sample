class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @posts = Post.all
    end

    def ran
      @posts = Post.all
    end

    def show
      @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
      end
    
      def create
        post = Post.new(post_params)

        post.user_id = current_user.id

        if post.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      private
      def post_params
        params.require(:post).permit(:name, :address, :price, :about, :image)
      end

end
