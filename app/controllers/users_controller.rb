class UsersController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: "ユーザーを更新しました"
    else
        flash.now[:danger] = "ユーザーを更新できませんでした"
        render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
