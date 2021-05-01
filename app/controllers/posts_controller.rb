class PostsController < ApplicationController
    before_action :set_blog, only: [:show, :edit, :update, :destroy]
    def index
        @post = Post.all
    end

    def new
        @post = Post.new
    end

    def create # creation des tweets 
        @post = Post.new(post_params)
        if @post.save 
            redirect_to new_post_path , notice: "Tweet créé"
        else
            render :new
        end
    end

    def edit
        
    end
   
    def show
        
    end
   
    def update # Mise à jour des tweets 
        if @post.update(post_params)
            redirect_to posts_path , notice:" Tweet Mise à jour avec succès!!"
        else 
            render :edit
        end
    end 
    def destroy
        @post.destroy
        redirect_to posts_path, notice:" Tweet supprimé avec success!"
    end

    def confirm
        @post = Post.new(post_params)
        render :new if @post.invalid?
    end
    
    ######### DEFINITION DES METHODES PRIVEES 
    private 
    
    def post_params
        params.require(:post).permit(:contenu)
    end
    
    def set_blog
        @post = Post.find(params[:id])
    end
end