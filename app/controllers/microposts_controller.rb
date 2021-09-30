class MicropostsController < ApplicationController
    def show
        @micropost = Micropost.find(params[:id])
        @comments = @micropost.comments.includes(:user)
        @comment = @micropost.comments.build 
    end
end
