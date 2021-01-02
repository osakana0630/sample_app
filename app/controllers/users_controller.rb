class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # 実装は終わっていないことに注意!
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      # 以下の処理はredirect_to user_url(@user)と等価
      # redirect_to @user
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
