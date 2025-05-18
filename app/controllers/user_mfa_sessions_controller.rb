class UserMfaSessionsController < ApplicationController
  skip_before_action :check_mfa

  def new
    @user = current_user
    session[:google_secret] = @user.google_secret
  end

  def create
    user = current_user
    if user.google_authentic?(params[:mfa_code])
      # binding.pry
      token = SecureRandom.hex(32)
      user.update!(mfa_session_token: token)
      UserMfaSession.create(user)
      flash[:notice] = "二段階認証に成功しました"
      redirect_to root_path
    else
      flash[:alert] = "コードが間違っています"
      render :new, status: :unprocessable_entity
    end
  end
end
