class DogsController < ApplicationController
    def index
      if params[:search] == nil
        @dogs= Dog.all
      elsif params[:search] == ''
        @dogs= Dog.all
      else
        @dogs = Dog.where("body LIKE ? ",'%' + params[:search] + '%')
      end
    end

    def new
        @dog = Dog.new
    end

    def create
        dog = Dog.new(dog_params)
        dog.user_id = current_user.id
        if dog.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @dog = Dog.find(params[:id])
        @comments = @dog.comments
        @comment = Comment.new
    end

    def edit
      @dog = Dog.find(params[:id])
    end

    def destroy
      dog = Dog.find(params[:id])
      dog.destroy
      redirect_to action: :index
    end

    def update
      dog = Dog.find(params[:id])
      if dog.update(dog_params)
        redirect_to :action => "show", :id => dog.id
      else
        redirect_to :action => "new"
      end
    end
    
      private
      def dog_params
        params.require(:dog).permit(:body, :image)
    end

end
