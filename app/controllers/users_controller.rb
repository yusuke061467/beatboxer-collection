class UsersController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create, :activate ]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "仮登録を完了しました。メールアドレスをご確認ください。"
      redirect_to root_path
    else
      flash.now[:alert] = "仮登録に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def activate
    if (user = User.load_from_activation_token(params[:id]))
      user.update(activation_state: "active")
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to login_path
    else
      flash.now[:alert] = "ユーザー登録に失敗しました。"
      not_authenticated
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
