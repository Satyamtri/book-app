class UsersController < ApplicationController
    before_action :require_admin, only: [:index, :show, :destroy]
    def index
        @users = User.all

        @q = User.ransack(params[:q])
        @users = @q.result(distinct: true)
    end

    def show 
        @user = User.find(params[:id])
        @book = @user.books
    end    
    def destroy 
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
     end
   
end