class UsersController < ApplicationController
 
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success]= 'ユーザ登録完了'
      redirect_to tasks_url
    else
      flash.now[:danger]='ユーザ登録失敗'
      render :new
    end  
  end
end

private
def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end