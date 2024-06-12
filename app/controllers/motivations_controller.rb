class MotivationsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        @motivations = Motivation.all
        @blogs = Blog.all
    end
    def new
        @motivation = Motivation.new
      end
    
      def create
        @motivation = current_user.motivations.build(motivation_params)
        if @motivation.save
          redirect_to motivations_path
        else
          render 'new'
        end
      end
      
      
      def update
        motivation = Motivation.find(params[:id])
        if motivation.update(motivation_params)
          redirect_to :action => "show", :id => motivation.id
        else
          redirect_to :action => "new"
        end
      end
      def destroy
        motivation = Motivation.find(params[:id])
        motivation.destroy
        redirect_to action: :index
      end
      def show
        @motivation= Motivation.find(params[:id])
        @comments = @motivation.comments
        @comment = Comment.new
      end
      def edit
        @motivation = Motivation.find(params[:id])
      end
    
      private
      def motivation_params
        params.require(:motivation).permit(:contents, :title)
      end
end

