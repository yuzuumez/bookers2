class UsersController < ApplicationController

  def index
    @books=Book.all
    @book=Book.new
    @users=User.all
    @user=current_user
    
  end

  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
    if @user == current_user
    render "edit"
    else
    redirect_to users_path
    end
  end

   def update
    @user= User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), alert: "You have updated user successfully."
    else
      render :edit
    end
   end

   private

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
  
end
