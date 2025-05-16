class UserMfaSessionsController < ApplicationController
  skip_before_action :check_mfa

  def new
    @user = current_user
  end

  def create
    user = current_user
    if user.google_authentic?(params[:mfa_code])
      UserMfaSession.create(user)
      flash[:alert] = "ログインに成功しました"
      redirect_to user_mfa_sessions_new_path
    else
      flash[:alert] = "コードが間違っています"
      render :new, status: :unprocessable_entity
    end
  end
end
